package com.wschool.Dao;

import java.util.List;

import com.wschool.entity.User;

public interface UserDao {
	public int add(User u);
    public User findbyusername(String username);
    public User findbyid(int id);
    public int  update(User u);
    public List<User> findadmin();
    public List<User> findshopuser();
	public List<User> findbyopenid(String openids);
	public void updateggw(User u); 
}
