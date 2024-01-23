package com.group3.service.impl;

import com.group3.enums.UserIdentity;
import com.group3.pojo.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class UserServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    UserServiceImpl userService =(UserServiceImpl) context.getBean("userServiceImpl");

    @Test
    public void add() {
        String name = "sk";
        String pwd = "123";
        System.out.println(userService.register(name,pwd));
    }

    @Test
    public void delete() {
        System.out.println(userService.delete(4));
    }

    @Test
    public void update() {
        User user = new User();
        user.setUserId(4);
        user.setUserName("seller1");
        user.setUserPwd("123456");
        user.setUserIdentity(UserIdentity.CUSTOMER);
        System.out.println(userService.update(user));
    }

    @Test
    public void getByUserId() {
    }

    @Test
    public void getByUserEmail() {
        System.out.println(userService.pwdLogin("addCustomer1","123"));
    }

    @Test
    public void getByUserName() {
        String name = "user1";
        System.out.println(userService.getByUserName(name));
    }

    @Test
    public void getByPhoneNumber() {
        String phoneNumber = "13144445555";
        System.out.println(userService.getByPhoneNumber(phoneNumber));

    }
}