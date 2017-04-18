package com.wschool.controller;


import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wschool.Dao.PictrueDao;
import com.wschool.entity.Pictrue;
import com.wschool.util.AjaxUtil;
import com.wschool.util.FileUp;
import com.wschool.util.Result;

@Controller
public class PictrueController {
	
	@Autowired
	private PictrueDao pictrueDao;
	
	
	@RequestMapping("/controller/addimage")
	public String addimage(@RequestParam("image") MultipartFile image,HttpServletRequest req,HttpServletResponse rep)
	{
		String url=FileUp.UpFile(image, req, "upload");
		if(url.equals(Result.ERROR+""))
		{
			req.setAttribute("error", "请上传像素大于1200万的高清图片");
			return "controller/pictruelist";
		}
		if(pictrueDao.add(new Pictrue(0,url))==1)
		return imagelist(req, rep);
		else
			return "redirect:404.jsp";
	}
	
	@RequestMapping("/controller/imagelist")
	public String imagelist(HttpServletRequest req,HttpServletResponse rep){
		List<Pictrue> plist=  pictrueDao.findall();
		req.getSession().setAttribute("plist", plist);
		return "redirect:pictruelist.jsp";
	}
	
	@RequestMapping("/controller/imagelistajax")
	public void imagelistajax(HttpServletRequest req,HttpServletResponse rep){
		List<Pictrue> plist=  pictrueDao.findall();
		AjaxUtil.PrintArrayClass(rep, plist);	
	}
	
	
	@RequestMapping("/controller/findimagebyidajax")
	public void findimagebyidajax(int id,HttpServletRequest req,HttpServletResponse rep){
		Pictrue p=  pictrueDao.findbyid(id);
		AjaxUtil.PrintResultS(rep, p.getUrl());
	}
	
	@RequestMapping("/controller/imagedelete")
	public String imagedelete(String array,HttpServletRequest req,HttpServletResponse rep){
		String[] list=array.split(",");
		for(int i=0;i<list.length;i++)
		{
			pictrueDao.delete(Integer.parseInt(list[i]));
		}
		return imagelist(req, rep);
	}
	
	


}
