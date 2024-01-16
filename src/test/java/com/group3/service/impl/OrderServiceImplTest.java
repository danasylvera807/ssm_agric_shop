package com.group3.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.group3.enums.OrderStatus;
import com.group3.pojo.Order;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class OrderServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    OrderServiceImpl orderService =(OrderServiceImpl) context.getBean("orderServiceImpl");

    @Test
    public void getOrderById() {
        System.out.println(orderService.getOrderById(1));
    }

    @Test
    public void getOrdersByUserId() {
    }

    @Test
    public void getAllOrders() {
    }
    @Test
    public void getOrdersByStatus() {
        PageInfo<Order> pageInfo = orderService.getOrdersByStatus(OrderStatus.PENDING_PAYMENT,1,2);
        System.out.println(pageInfo);
    }


    @Test
    public void addOrder() {
    }

    @Test
    public void updateOrder() {
    }

    @Test
    public void deleteOrder() {
    }
}