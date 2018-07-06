package com.diiwon.plat.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.diiwon.plat.dao.UserMapper;
import com.diiwon.plat.model.User;

/*
 * 登陆接口
 */
@Controller
public class Login {
	@Resource(name="UserDao")
	UserMapper userDao;
	public UserMapper getUserDao() {
		return userDao;
	}
	public void setUserDao(UserMapper userDao) {
		this.userDao = userDao;
	}
	
	//登陆跳转
	@RequestMapping(value="login.do",method=RequestMethod.GET)
	public String login01() {
		return "login";
	}
	
	//对登陆的用户信息进行存储
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String login02(HttpSession session,HttpServletResponse response,String keepPwd,User u,ModelMap map) {
		User user=userDao.selByPhoneAndPwd(u.getPhone(), u.getPwd());
		if (user!=null) {
			session.setAttribute("user", user);
//			System.out.println(user);
//			for (String name : session.getValueNames()) {
//				System.out.println(name);
//			}
			if (keepPwd!=null && keepPwd.equals("1")) {
				Cookie cookie=new Cookie(user.getPhone(), user.getPwd());
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
			return "redirect:index.do";
		}
		return "login";
	}
	
	//app登陆
	@RequestMapping(value="appLogin.do",method=RequestMethod.POST)
	@ResponseBody
	public User appLogin01(String account,String pwd) {
		User user=userDao.selByPhoneAndPwd(account, pwd);
		return user;
	}
	
	//登出
	@RequestMapping(value="loginOut.do",method=RequestMethod.GET)
	public String loginOut01(HttpSession session) {
		session.invalidate();
		return "redirect:login.do";
	}
	
	@RequestMapping(value="register.do",method=RequestMethod.GET)
	public String register01() {
		return "register";
	}
	
	@RequestMapping(value="register.do",method=RequestMethod.POST)
	public String register02(User u) {
		System.out.println(u);
		//userDao.insert(u);
		return "redirect:login.do";
	}
}
