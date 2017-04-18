package com.wschool.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wschool.Dao.ClassesDao;
import com.wschool.entity.Classes;
import com.wschool.util.AjaxUtil;
import com.wschool.util.Result;

@Controller
public class ClassesController {

	@Autowired
	private ClassesDao classesDao;
	
	@RequestMapping("/controller/addclasses")
	public void add(Classes classes,HttpServletResponse rep)
	{
		classes.setName(URLDecoder.decode(URLDecoder.decode(classes.getName())));
		int id=classesDao.add(classes);
		if(id>Result.ERROR)
		{
			AjaxUtil.PrintResult(rep, classes.getId());
		}
		else
			AjaxUtil.PrintResult(rep, Result.ERROR);
	}
	
	@RequestMapping("/controller/classeslist")
	public void classeslist(Integer shopid,HttpServletRequest req,HttpServletResponse rep)
	{
		List<Classes> clist=classesDao.findbyshopid(shopid);
		AjaxUtil.PrintArrayClass(rep, clist);
	}
	
	@RequestMapping("/controller/classesdelete")
	public void classesdelete(int classesid,HttpServletRequest req,HttpServletResponse rep)
	{
		try {
			classesDao.delete(classesid);
		} catch (Exception e) {
			AjaxUtil.Print(rep, Result.ERROR);
			e.printStackTrace();
		}
		AjaxUtil.Print(rep, Result.SUCCESS);
	}
}
