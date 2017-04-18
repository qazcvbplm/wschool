package com.wschool.serviceImple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.wschool.Dao.ShopDao;
import com.wschool.Dao.UserDao;
import com.wschool.entity.Shop;
import com.wschool.entity.User;
import com.wschool.service.ShopServiceDao;
import com.wschool.util.Result;

@Component
public class ShopServiceDaoImple implements ShopServiceDao{
	@Autowired
	private UserDao userDao;
	@Autowired
	private ShopDao shopDao;

	@Override
	public List<Shop> shoplist() {
		return shopDao.findall();
	}

	@Override
	public int add(Shop shop) {
		
		
		if(shop.getStatus().equals("on"))
			shop.setStatus(Result.SHOP_OPEN+"");
		else
			shop.setStatus(Result.SHOP_CLOSE+"");
		int rs;
		try {
			rs = shopDao.add(shop);
		} catch (Exception e) {
			rs=Result.ERROR;
		}
		return rs;
	}

	@Override
	public Shop findbyid(int id) {
		return shopDao.findbyid(id);
	}

	@Override
	public int update(Shop s,String username,String password) {
		   User u=new User();
		   u.setType(Result.USER_TYPE_SHOP);
		if(s.getAppid()==Result.ERROR&&!username.equals("")&&!password.equals(""))
		{
			u.setUsername(username);
			u.setPassword(password);
			userDao.add(u);
			s.setAppid(u.getId());
		}else if(s.getAppid()!=Result.ERROR)
		{
			u.setId(s.getAppid());
			u.setUsername(username);
			u.setPassword(password);
			userDao.update(u);
		}
		try {
			if(s.getStatus().equals("on"))
				s.setStatus("1");
		} catch (NullPointerException e) {
			s.setStatus("0");
		}
		if(shopDao.update(s)==Result.SUCCESS)
		return Result.SUCCESS;
		else
			return Result.ERROR;
	}

	@Override
	public Shop findmyshop(int appid) {
		Shop shop=shopDao.findbyappid(appid);
		return shop;
	}

	@Override
	public int deleteshopbyid(int id) {
		int rs=Result.SUCCESS;
		try {
			shopDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			rs=Result.ERROR;
		}
		return rs;
	}

}
