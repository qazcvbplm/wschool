package com.wschool.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.wschool.entity.Product;

public interface ProductServiceDao {
     public int addproduct(Product p,MultipartFile file,HttpServletRequest req);

	public List<Product> findbyclassid(int classesid);
	
	
	public Product findbyid(int id);
	
	
	public int update(Product p, MultipartFile pic, HttpServletRequest req);
	
	public int deleteproductbyid(int id);
}
