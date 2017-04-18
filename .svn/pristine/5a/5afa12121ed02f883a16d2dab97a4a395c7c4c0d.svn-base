package com.wschool.serviceImple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wschool.Dao.UserDao;
import com.wschool.entity.User;
import com.wschool.service.UserServiceDao;
import com.wschool.util.Result;

@Component
public class UserServiceDaoImple implements UserServiceDao{
	@Autowired
	private UserDao userDao;

	@Override
	public int adminlogin(User u) {
		List<User> list=userDao.findadmin();
		for(int i=0;i<list.size();i++)
		{
			User temp=list.get(i);
			if(u.getUsername().equals(temp.getUsername())&&u.getPassword().equals(temp.getPassword()))
			{
				return temp.getId();
			}
		}
		
		return Result.ERROR;
	}

	@Override
	public int Update(User u) {
		return userDao.update(u);
	}

	@Override
	public int shoplogin(User u) {
		List<User> list=userDao.findshopuser();
		for(int i=0;i<list.size();i++)
		{
			User temp=list.get(i);
			if(u.getUsername().equals(temp.getUsername())&&u.getPassword().equals(temp.getPassword()))
			{
				return temp.getId();
			}
		}
		
		return Result.ERROR;
	}

	@Override
	public List<User> findbyopenid(String openids) {
		return userDao.findbyopenid(openids);
	}

}
