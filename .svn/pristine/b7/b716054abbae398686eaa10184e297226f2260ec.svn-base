package com.wschool.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wschool.Dao.ProductDao;
import com.wschool.entity.Orders;
import com.wschool.entity.Product;
import com.wschool.service.ProductServiceDao;
import com.wschool.util.AjaxUtil;
import com.wschool.util.Result;

@Controller
public class ProductController {
	@Autowired
	private ProductServiceDao productServiceDao;
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/controller/productlist")
	public String productlist(int classesid,HttpServletRequest req)
	{
		List<Product> plist=productServiceDao.findbyclassid(classesid);
		req.getSession().setAttribute("plist", plist);
		req.getSession().setAttribute("classesid", classesid);
		return "redirect:productlist.jsp";
	}
	
	@RequestMapping("/controller/addproduct")
	public String productlist(Product p,HttpServletRequest req, MultipartFile pic)
	{
		int rs=Result.ERROR;
		try {
			rs = productServiceDao.addproduct(p, pic, req);
		} catch (RuntimeException e) {
			System.out.println("添加失败");
		}
		if(rs==Result.SUCCESS)
		{
            List<Product> list=(List<Product>) req.getSession().getAttribute("plist");  
            list.add(p);
			return "redirect:productlist.jsp";
		}
		else
			return "redirect:404.jdp";
	}
	
	@RequestMapping("/controller/findproductbyid")
	public String findproductbyid(@RequestParam(defaultValue="0") int id,HttpServletRequest req)
	{
		Product p=productServiceDao.findbyid(id);
		req.setAttribute("product", p);
		return "controller/editorproduct";
	}
	
	
	@RequestMapping("/controller/updateproduct")
	public String updateproduct(@RequestParam(required=false) MultipartFile pic, Product p,HttpServletRequest req)
	{
		int rs=productServiceDao.update(p,pic,req);
		if(rs==Result.SUCCESS)
		return productlist(p.getClassesid(), req);
		else
			return findproductbyid(p.getId(), req);
	}
	
	@RequestMapping("/controller/deleteproduct")
	public String deleteproduct(int id,HttpServletRequest req)
	{
		int rs=productServiceDao.deleteproductbyid(id);
		if(rs==Result.SUCCESS)
		return productlist(Integer.parseInt(req.getSession().getAttribute("classesid").toString()), req);
		else
		return "redirect:404.jsp";
	}
	
	@RequestMapping("/wx/orderj")
	public void orderj(String ids,HttpServletResponse rep)
	{
		String a[]=ids.split(",");
		List<Product> rs=new ArrayList<Product>();
		for(int i=0;i<a.length;i++)
		{
			int id=Integer.parseInt(a[i]);
			Product p=productDao.findbyid(id);
			rs.add(p);
		}
		AjaxUtil.PrintArrayClass(rep, rs);
	}
	


}
