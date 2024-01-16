package com.group3.service.impl;

import com.github.pagehelper.PageInfo;
import com.group3.pojo.TestPojo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



public class TestServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    TestServiceImpl testService =(TestServiceImpl) context.getBean("testServiceImpl");

    @Test
    public void getAll() {
        for (TestPojo testPojo :
                testService.getAll()) {
            System.out.println(testPojo);
        }
    }

    @Test
    public void getByPage() {
        PageInfo<TestPojo> page = testService.getByPage(2, 5);
        System.out.println(page.getPages());
        System.out.println(page.isIsFirstPage());
        System.out.println(page.isIsLastPage());
        System.out.println(page.getTotal());
        System.out.println(page);
    }
}