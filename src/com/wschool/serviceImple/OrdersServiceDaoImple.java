package com.wschool.serviceImple;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wschool.Dao.AddressDao;
import com.wschool.Dao.ClassesDao;
import com.wschool.Dao.OProductDao;
import com.wschool.Dao.OrdersDao;
import com.wschool.Dao.ProductDao;
import com.wschool.entity.Address;
import com.wschool.entity.Classes;
import com.wschool.entity.OProduct;
import com.wschool.entity.Orders;
import com.wschool.entity.Product;
import com.wschool.service.OrderServiceDao;
import com.wschool.util.Result;

@Component
public class OrdersServiceDaoImple implements OrderServiceDao{
	
	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private AddressDao addressdao;
	@Autowired
	private OProductDao oproductDao;
	@Autowired
	private ClassesDao classesDao;
	@Override
	public List<Orders> adminsearch() {
		return ordersDao.findall();
	}

	@Override
	public Orders findone(int id) {
		return ordersDao.findbyid(id);
	}

	@Override
	public List<Orders> findbytime(String st, String et,int shopid) {
		Map<String,String> map=new HashMap<String,String>();
		map.put("st", st);
		map.put("et", et);
		map.put("shopid", shopid+"");
		return ordersDao.findbytime(map);
	}

	@Override
	public List<Orders> findbyshop(int id) {
		return ordersDao.findbyshopid(id);
	}

	@Override
	public int update(int id,int type) {
		Orders o=ordersDao.findbyid(id);
		o.setPaystatus(type+"");
		if(type==1)
		o.setPaytime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));	
		else
		o.setPaytime(null);
		return ordersDao.updatestatus(o);
	}

	@Override
	public List<Orders> findbystatus(Orders o) {
		return ordersDao.findbystatus(o);
	}

	
	@Override
	@Transactional
	public int order(String ids, String counts, Orders o) {
		String pid[]=ids.split(",");
		String cou[]=counts.split(",");
	/*	Address a=addressdao.findbyid(o.getAddressid());
		o.setAddressname(a.getName());
		o.setAddressphone(a.getPhone());
		o.setAddressdetail(a.getDetail());*/
		double total=0;
		total+=o.getBoxprice();
		total+=o.getSendprice();
		for(int i=0;i<pid.length;i++)
		{
			int id=Integer.parseInt(pid[i]);
			Product p=productDao.findbyid(id);
			int num=Integer.parseInt(cou[i]);
			total+=p.getPrice()*(num*1.00);
			if(i==0)
			{
				Classes c=classesDao.findbyidc(p.getClassesid());
				o.setShopid(c.getShopid());
			}
		}
		o.setTotalprice(total);
		o.setOrdernumber("ws"+new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()));
		o.setPaystatus(Result.ERROR+"");
		try {
			ordersDao.add(o);
		} catch (Exception e) {
			e.printStackTrace();
			return Result.ERROR;
		}
		for(int i=0;i<pid.length;i++)
		{
			int id=Integer.parseInt(pid[i]);
			Product p=productDao.findbyid(id);
			OProduct op=new OProduct();
			op.setProductid(id);
			op.setOrderid(o.getId());
			int num=Integer.parseInt(cou[i]);
			op.setCount(num);
			op.setTotal(p.getPrice()*num);
			try {
				oproductDao.add(op);
			} catch (Exception e) {
				e.printStackTrace();
				return Result.ERROR;
			}
		}
		
		
		
		return Result.SUCCESS;
	}
	
	
	
	

}
