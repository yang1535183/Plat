package com.diiwon.plat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.diiwon.plat.dao.TwoDecorationMapper;
import com.diiwon.plat.dao.UserMapper;
import com.diiwon.plat.model.TwoDecoration;
import com.diiwon.plat.model.User;
/**
 * 加载主界面
 * @author Administrator
 *
 */
@Controller
public class Index {

	@Resource(name="TwoDao")
	TwoDecorationMapper twoDao;
	
	@Resource(name="UserDao")
	UserMapper userDao;
	public TwoDecorationMapper getTwoDao() {
		return twoDao;
	}
	public void setTwoDao(TwoDecorationMapper twoDao) {
		this.twoDao = twoDao;
	}

	public UserMapper getUserDao() {
		return userDao;
	}
	public void setUserDao(UserMapper userDao) {
		this.userDao = userDao;
	}
	@RequestMapping(value="index.do",method=RequestMethod.GET)
	public String index01() {
		return "index";
	}
	
	//过度页
	@RequestMapping(value="welcome.do",method=RequestMethod.GET)
	String welcome01(ModelMap map,String name) {
		map.addAttribute("pageName", name);
		return "welcome";
	}
	
	//二次装修
	@RequestMapping(value="twoDecoration.do",method=RequestMethod.GET)
	public String twoDecoration01() {
		return "TwoDecoration";
	}
	
	@RequestMapping(value="twoDecoration.do",method=RequestMethod.POST)
	public String twoDecoration02(TwoDecoration td,HttpSession session) {
		System.out.println(td);
		User user=(User) session.getAttribute("user");
		td.setUid(user.getId());
		td.setType("二次装修");
		td.setState("待审核");
		twoDao.insert(td);
		return "redirect:lookListTwo.do";
	}
	
	//按用户展示二次装修列表
	@RequestMapping(value="lookListTwo.do",method=RequestMethod.GET)
	public String twoDecoration03(ModelMap map,HttpSession session) {
		User user=(User) session.getAttribute("user");
		List<TwoDecoration> list=new ArrayList<TwoDecoration>();
		if (user.getIdentify()==0) {
			list=twoDao.getAll();
		}else {
			list=twoDao.getByUid(user.getId());
		}
		System.out.println(user);
		System.out.println(list.size());
		map.addAttribute("list", list);
		return "listTwo";
	}
	
	//二次装修详情展示
	@RequestMapping(value="showTwo.do",method=RequestMethod.GET)
	public String showTwo01(ModelMap map,String id) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(id));
		map.addAttribute("td", td);
		return "TwoDecoration";
	}
	
	//按用户返回相应二次装修列表
	@RequestMapping(value="hTSB.do",method=RequestMethod.GET)
	public String hTSB01(HttpSession session,ModelMap map) {
		User user=(User) session.getAttribute("user");
		List<TwoDecoration> list=new ArrayList<TwoDecoration>();
		if (user.getIdentify()==0) {
			list=twoDao.getAll();
		}else {
			list=twoDao.getByUid(user.getId());
		}
		System.out.println(user);
		System.out.println(list.size());
		map.addAttribute("list", list);
		return "hTSB";
	}
	
	//pageoffice页面
	@RequestMapping(value="contract.do",method=RequestMethod.GET)
	public String contract01() {
		return "contract";
	}
	
	//二次装修通过
	@RequestMapping(value="passTwo.do",method=RequestMethod.GET)
	public String passTwo01(String id,ModelMap map){
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(id));
		td.setState("通过");
		twoDao.updateByPrimaryKey(td);
		List<TwoDecoration> list=new ArrayList<TwoDecoration>();
		list=twoDao.getAll();
		map.addAttribute("list", list);
		return "listTwo";
	}
	
	//二次装修通过
	@RequestMapping(value="repulseTwo.do",method=RequestMethod.GET)
	public String repulseTwo01(String id,ModelMap map){
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(id));
		td.setState("未通过");
		twoDao.updateByPrimaryKey(td);
		List<TwoDecoration> list=new ArrayList<TwoDecoration>();
		list=twoDao.getAll();
		map.addAttribute("list", list);
		return "listTwo";
	}
	
	//二次装修打回
	@RequestMapping(value="repulseTwo2.do",method=RequestMethod.GET)
	public String repulseTwo02(String id,ModelMap map) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(id));
		map.addAttribute("td", td);
		return "repulseTwo";
	}
	
	//打回并存储审批人意见
	@RequestMapping(value="repulseTwo2.do",method=RequestMethod.POST)
	public String repulseTwo03(String id,String info,ModelMap map) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(id));
		td.setInfo(info);
		twoDao.updateByPrimaryKey(td);
		map.addAttribute("td", td);
		List<TwoDecoration> list=new ArrayList<TwoDecoration>();
		list=twoDao.getAll();
		map.addAttribute("list", list);
		return "listTwo";
	}
	
	//合同通过
	@RequestMapping(value="hTPass.do",method=RequestMethod.GET)
	public String hTPass01(String id) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(id));
		td.setHtstate("通过");
		twoDao.updateByPrimaryKey(td);
		return "redirect:hTSB.do";
	}
	
	//合同拒绝
	@RequestMapping(value="hTRepulse.do",method=RequestMethod.GET)
	public String hTRepulse01(String id) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(id));
		td.setHtstate("未通过");
		twoDao.updateByPrimaryKey(td);
		return "redirect:hTSB.do";
	}
	
	//统一社会信用代码
	@RequestMapping(value="code.do",method=RequestMethod.GET)
	@ResponseBody
	public int code01(String code,String id) {
		System.out.println(code+id);
		User user=userDao.selectByPrimaryKey(Integer.parseInt(id));
		user.setCode(code);
		int result= userDao.updateByPrimaryKey(user);
		return result;
	}
}
