package com.diiwon.plat.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.diiwon.plat.dao.RecordMapper;
import com.diiwon.plat.dao.TwoDecorationMapper;
import com.diiwon.plat.dao.UserMapper;
import com.diiwon.plat.model.Record;
import com.diiwon.plat.model.User;
/*
 * 测试类
 */
public class TestMain {

	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
//		TwoDecorationMapper tm=(TwoDecorationMapper) ac.getBean("TwoDao");
//		System.out.println(tm.getByTypeAndState("装饰工程", "审批通过"));
//		UserMapper userDao=(UserMapper) ac.getBean("UserDao");
//		User u=userDao.selByPhoneAndPwd("123123", "123123");
//		System.out.println(u);
		
		RecordMapper rm=(RecordMapper) ac.getBean("RecordDao");
		Record r=new Record();
		r.setTid(6);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		r.setRdate(sdf.format(new Date()));
		r.setRaction("工程上报");
		System.out.println(r);
		System.out.println(rm.insert(r));
	}
}
