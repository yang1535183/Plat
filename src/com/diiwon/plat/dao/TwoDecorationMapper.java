package com.diiwon.plat.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diiwon.plat.model.TwoDecoration;

@Repository("TwoDao")
public interface TwoDecorationMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(TwoDecoration record);

	int insertSelective(TwoDecoration record);

	TwoDecoration selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(TwoDecoration record);

	int updateByPrimaryKey(TwoDecoration record);

	//根据用户的id获取对应的工程信息
	List<TwoDecoration> getByUid(int uid);

	//获取所有的工程信息
	List<TwoDecoration> getAll();

	//根据工程类型获取工程信息
	List<TwoDecoration> getByType(String type);

	//根据工程状态获取工程信息
	List<TwoDecoration> getByState(String state);

	//根据合同状态获取工程信息
	List<TwoDecoration> getByHTState(String hTState);

	//根据类型和工程状态获取工程信息
	List<TwoDecoration> getByTypeAndState(String type, String state);

	//根据工程类型和工程状态以及合同状态获取工程信息
	List<TwoDecoration> getByTypeAndStateAndHtState(String string, String string2, String string3);
	
	//获取已完结的工程信息
	List<TwoDecoration> getEndGC(String uid);
	
	//根据用户及工程类型和报监状态筛选工程
	List<TwoDecoration> getByUidAndTypeAndState(int id,String type,String state);
	
}