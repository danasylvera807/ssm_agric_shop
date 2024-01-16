package com.group3.db;

import com.group3.service.impl.UserServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DBTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    UserServiceImpl userService =(UserServiceImpl) context.getBean("userServiceImpl");

    @Test
    public void getByUserId(){
        System.out.println(userService.getByUserId(1));

    }
}
