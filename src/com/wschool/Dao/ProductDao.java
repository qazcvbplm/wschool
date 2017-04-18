package com.wschool.Dao;

import java.util.List;

import com.wschool.entity.Product;

public interface ProductDao {
	public int add(Product p);
	public List<Product> findbyclassid(int classid);
	public Product findbyid(int id);
    public int update(Product p);
    public void deletebyid(int id);
    public void sale(int id);
}
