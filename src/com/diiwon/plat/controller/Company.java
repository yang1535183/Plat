package com.diiwon.plat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.diiwon.plat.dao.TwoDecorationMapper;
import com.diiwon.plat.dao.UserMapper;
import com.diiwon.plat.model.TwoDecoration;
import com.diiwon.plat.model.User;
/*
 * 企业项目一览
 */
@Controller
public class Company {

	@Resource(name="UserDao")
	UserMapper userDao;
	@Resource(name="TwoDao")
	TwoDecorationMapper twoDao;
	public UserMapper getUserDao() {
		return userDao;
	}
	public void setUserDao(UserMapper userDao) {
		this.userDao = userDao;
	}
	public TwoDecorationMapper getTwoDao() {
		return twoDao;
	}
	public void setTwoDao(TwoDecorationMapper twoDao) {
		this.twoDao = twoDao;
	}
	
	//根据登陆用户的不同拉取不同的企业信息
	@RequestMapping(value="CompanyList.do",method=RequestMethod.GET)
	public String compangList01(HttpSession session,ModelMap map) {
		User user=(User) session.getAttribute("user");
		List<User> list=new ArrayList<User>();
		if (user.getIdentify()==1) {
			list.add(user);
		}else {
			list=userDao.getAllCompany();
		}
		
		map.addAttribute("list", list);
		return "CompanyList";
	}
	
	//获取用户的工程列表
	@RequestMapping(value="gcList01.do",method=RequestMethod.GET)
	public String gcList01(String uid,ModelMap map) {
		List<TwoDecoration> ZSGCList =new ArrayList<TwoDecoration>();
		ZSGCList=twoDao.getEndGC(uid);
		map.addAttribute("ZSGCList", ZSGCList);
		return "GCList";
	}
}
