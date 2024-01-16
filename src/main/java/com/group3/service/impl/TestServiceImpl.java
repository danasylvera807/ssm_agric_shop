package com.group3.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.mapper.TestMapper;
import com.group3.pojo.TestPojo;
import lombok.Setter;

import java.util.List;
@Setter
public class TestServiceImpl{
    private TestMapper testMapper;
    public List<TestPojo> getAll(){
        return testMapper.getAll();
    }

    public PageInfo<TestPojo> getByPage(int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<TestPojo> testPojoList = testMapper.getAll();
        return new PageInfo<>(testPojoList);
    }
}
