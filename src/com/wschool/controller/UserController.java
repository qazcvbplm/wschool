package com.wschool.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.wschool.Dao.UserDao;
import com.wschool.entity.User;
import com.wschool.service.UserServiceDao;
import com.wschool.util.AjaxUtil;
import com.wschool.util.FileUp;
import com.wschool.util.HTTPParam;
import com.wschool.util.HTTPSend;
import com.wschool.util.Result;

@Controller
public class UserController {
	 @Autowired
	 private UserServiceDao userServiceDao;
	 @Autowired
	 private UserDao userDao;
	 
		private  final String appid="wx3b9f2601545a0987";//wx750e248ada94beee,wxa75115dccbe8ecec
		private  final String secert="4f7a2f3bcd9732db6ea6ed353479ed94";//20c81253f1895ef460edea93e864e50c,193c497589ddb70f1953f685cc1199c9
		private  String js_code="";
		private  String url="https://api.weixin.qq.com/sns/jscode2session?appid=";
		public   static String session_key="";
		public   static Map<String,Map<String,Object>> map=new HashMap<String,Map<String,Object>>();
		private final static String locationurl="http://api.map.baidu.com/geocoder/v2/?ak=btsVVWf0TM1zUBEbzFz6QqWF";
	
	@RequestMapping("controller/login")
      public String login(User u,HttpServletRequest req)
      {
		   int rs; 
    	  if(u.getUsername().length()<=0||u.getPassword().length()<=0)
    	  {
              req.getSession().setAttribute("error", "账号或密码不能为空");   		  
    		  return "redirect:login.jsp";
    	  }else{
    		  rs=userServiceDao.adminlogin(u);
    	  }
    	  if(rs!=Result.ERROR){
    		  u.setId(rs);
    		  req.getSession().setAttribute("admin", u);
    		  req.getSession().setAttribute("error", null);
		       return "redirect:index.jsp";
		    }else
		    {
		    	 req.getSession().setAttribute("error", "账号或密码错误");
		    	 return "redirect:login.jsp";
		    }
      }
	
	@RequestMapping("android/login")
    public void androidlogin(User u,HttpServletRequest req,HttpServletResponse rep)
    {
		   int rs = 0; 
  	  if(u.getUsername().length()<=0||u.getPassword().length()<=0)
  	  {
            req.getSession().setAttribute("error", "账号或密码不能为空");   		  
  		    AjaxUtil.Print(rep, Result.ERROR);
  	  }else{
  		  rs=userServiceDao.shoplogin(u);
  	  }
  	  if(rs!=Result.ERROR)
  	        {
  		       AjaxUtil.Print(rep,rs);
		    }else
		    {
		    	 AjaxUtil.Print(rep, Result.ERROR);
		    }
    }
	
	@RequestMapping("wx/login")
	public void wxlogin(String code,HttpServletResponse rep)
	{
		this.js_code=code;
		Gson gson=new Gson();
		String nurl=url+appid+"&secret="+secert+"&js_code="+js_code+"&grant_type=authorization_code";
		HTTPSend send=new HTTPSend();
		try {
			String rs=send.sendGet(nurl, new ArrayList<HTTPParam>());
			JsonObject json=gson.fromJson(rs, JsonObject.class);
			if(json.get("openid")==null)
			{
				AjaxUtil.PrintString(rep, 0+"");
			}
			else
			{
				String openids=json.get("openid").toString();
				session_key=json.get("session_key").toString();
				openids=openids.replace("\"", "");
				List<User> list=userServiceDao.findbyopenid(openids);
				User u;
				if(list.size()==0)
				{
					u=new User();
					u.setOpenid(openids);
					u.setUsername(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
					u.setPassword("");
					u.setType(Result.USER_TYPE_USER);
					userDao.add(u);
				}else
				{
					u=list.get(0);
				}
					Map<String, Object> session=new HashMap<String, Object>();
					map.put(openids, session);
					AjaxUtil.PrintArrayClass(rep, u);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("controller/loginout")
    public String login(HttpServletRequest req)
    {
		req.getSession().setAttribute("admin", null);
		return "redirect:login.jsp";
    }
	
	
	@RequestMapping("controller/updatepass")
    public String update(HttpServletRequest req,User u)
    {
		int rs=userServiceDao.Update(u);
		if(rs!=Result.SUCCESS)
		{
			req.getSession().setAttribute("error", "修改失败请重试");
		}else
		{
			User admin=(User)req.getSession().getAttribute("admin");
			admin.setPassword(u.getPassword());
		}
		return "redirect:updateadminpass.jsp";
			
    }
	
	
	@RequestMapping("controller/updateggw")
    public String updateggw(HttpServletRequest req,@RequestParam(value="image",required=false)MultipartFile[] image)
    {
		User u=userDao.findbyusername("admin");
		String lbt="";
		    for(int i=0;i<3;i++)
		    {
		    	if(!image[i].isEmpty())
		    	{
		    		String rs=FileUp.UpFile(image[i], req, "upload",i+"");
		    		lbt+=rs+",";
		    	}else
		    	{
		    		lbt+="-,";
		    	}
		    }
		    u.setGgw(lbt);
		    userDao.updateggw(u);
			return "redirect:ggw.jsp";
    }
	
	@RequestMapping("controller/ggw")
    public String ggw(HttpServletRequest req)
    {
		
		    User u=userDao.findbyusername("admin");
		    String[] image=u.getGgw().split(",");
		    req.getSession().setAttribute("m1", image[0]);
		    req.getSession().setAttribute("m2", image[1]);
		    req.getSession().setAttribute("m3", image[2]);
			return "redirect:ggw.jsp";
    }
	
	@RequestMapping("wx/ggw")
    public void wxggw(HttpServletRequest req,HttpServletResponse rep)
    {
		
		    User u=userDao.findbyusername("admin");
		    String[] image=u.getGgw().split(",");
		    JsonObject json=new JsonObject();
		    json.addProperty("m1", image[0]);
		    json.addProperty("m2", image[1]);
		    json.addProperty("m3", image[2]);
		    
		    AjaxUtil.PrintJson(rep, json);
		    
    }
	
	@RequestMapping("controller/ggwt")
    public void cggw(HttpServletRequest req,HttpServletResponse rep)
    {
		
	
		    AjaxUtil.PrintResultS(rep, "123");
		    
    }
	
	
}
