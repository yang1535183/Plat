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
import com.diiwon.plat.model.TwoDecoration;
import com.diiwon.plat.model.User;
/*
 * 待办事宜
 */
@Controller
public class ToDo {
	@Resource(name = "TwoDao")
	TwoDecorationMapper twoDao;

	public TwoDecorationMapper getTwoDao() {
		return twoDao;
	}

	public void setTwoDao(TwoDecorationMapper twoDao) {
		this.twoDao = twoDao;
	}
	
	//根据用户的不同筛选对应的待办事宜
	@RequestMapping(value = "ToDo.do", method = RequestMethod.GET)
	public String getAllToDo(HttpSession session,ModelMap map) {
		User user = (User) session.getAttribute("user");
		List<TwoDecoration> list = new ArrayList<TwoDecoration>();
		List<TwoDecoration> list2 = new ArrayList<TwoDecoration>();
		switch (user.getIdentify()) {
		case 1:
			list2 = twoDao.getByUid(user.getId());
			for (TwoDecoration twoDecoration : list2) {
				if ("未通过".equals(twoDecoration.getState()) 
						|| "审批通过".equals(twoDecoration.getState())
						|| "未通过".equals(twoDecoration.getHtstate())
						|| "审批通过".equals(twoDecoration.getHtstate())) {
					list.add(twoDecoration);
				}
			}
			break;
		case 2:
			list2 = twoDao.getByType(user.getPosition());
			for (TwoDecoration twoDecoration : list2) {
				if (twoDecoration.getType().equals(user.getPosition())
						&& "待审核".equals(twoDecoration.getHtstate())) {
					list.add(twoDecoration);
				}
			}
			break;
		case 3:
			list2=twoDao.getByType(user.getPosition());
			for (TwoDecoration twoDecoration : list2) {
				if (twoDecoration.getType().equals(user.getPosition())
						&& "初审通过".equals(twoDecoration.getHtstate())
						|| "待审核".equals(twoDecoration.getState())) {
					list.add(twoDecoration);
				}
			}
			break;
		case 4:
			String tid[]=user.getPosition().split(",");
			TwoDecoration td=null;
			for (String string : tid) {
				if (!string.equals("") && string!=null) {
					td=twoDao.selectByPrimaryKey(Integer.parseInt(string));
					if ("审核通过".equals(td.getHtstate())
							|| "审核通过".equals(td.getState())) {
						list2.add(td);
					}
				}
			}
			list.addAll(list2);
			break;

		default:
			break;
		}
		map.addAttribute("list", list);
		return "ToDo";
	}
}
