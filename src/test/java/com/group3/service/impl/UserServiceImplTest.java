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
        User user = new User();
        user.setUserName("addCustomer");
        user.setUserPwd("123");
        user.setUserIdentity(UserIdentity.CUSTOMER);
        System.out.println(userService.add(user));
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
        user.setUserIdentity(UserIdentity.SELLER);
        System.out.println(userService.update(user));
    }

    @Test
    public void getByUserId() {
    }

    @Test
    public void getByUserEmail() {
        String email = "308465@gmail.com";
        System.out.println(userService.getByUserEmail(email));
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