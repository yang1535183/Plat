package com.diiwon.plat.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diiwon.plat.model.User;

@Repository("UserDao")
public interface UserMapper {
	//删除
	int deleteByPrimaryKey(Integer id);
	
	int insert(User record);
	
	int insertSelective(User record);

	User selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);
	
	//根据用户的手机号和密码获取用户
	User selByPhoneAndPwd(String phone, String pwd);
	
	//按工程类型获取用户
	List<User> getUserByGCType(String type);
	
	//获取身份权限为4的用户
	List<User> getLinDao();
	
	//获取所有已进行备案的公司
	List<User> getAllCompany();
}