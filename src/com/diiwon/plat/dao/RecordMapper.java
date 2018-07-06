package com.diiwon.plat.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.diiwon.plat.model.Record;

@Repository("RecordDao")
public interface RecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);

    //获取当前工程的所有记录信息
    List<Record> getAllByTid(int tid);
}