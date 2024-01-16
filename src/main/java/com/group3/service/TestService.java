package com.group3.service;

import com.github.pagehelper.PageInfo;
import com.group3.pojo.TestPojo;

import java.util.List;

public interface TestService {
    public List<TestPojo> getAll();
    public PageInfo<TestPojo> getByPage(int pageNum, int pageSize);
}
