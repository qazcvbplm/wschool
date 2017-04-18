package com.wschool.entity;

import java.io.Serializable;

public class User implements Serializable {
	private int id;
	private String username;
	private String password;
	private int type;
	private String openid;
	private  String ggw;
	
	
	
	public String getGgw() {
		return ggw;
	}
	public void setGgw(String ggw) {
		this.ggw = ggw;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	

}
