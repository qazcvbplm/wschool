package com.wschool.entity;

import java.io.Serializable;
import java.util.List;

public class Classes implements Serializable{
	private int id;
	private String name;//分类名字
    private int shopid;//所属商店id
    private Shop shopc;
    private List<Product> ps;
    
	public Shop getShopc() {
		return shopc;
	}
	public void setShopc(Shop shopc) {
		this.shopc = shopc;
	}
	public List<Product> getPs() {
		return ps;
	}
	public void setPs(List<Product> ps) {
		this.ps = ps;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public Shop getShop() {
		return shopc;
	}
	public void setShop(Shop shop) {
		this.shopc = shop;
	}

    
}
