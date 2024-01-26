package com.group3.service.impl;

import com.group3.enums.OrderState;
import com.group3.pojo.Order;
import com.group3.pojo.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class OrderServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    OrderServiceImpl orderService =(OrderServiceImpl) context.getBean("orderServiceImpl");

    @Test
    public void getOrderById() {
        System.out.println(orderService.getOrderById(1));
    }

    @Test
    public void getOrdersByUserId() {
        System.out.println(orderService.getOrdersByUserId(1,OrderState.PROCESSING,1,3));
    }

    @Test
    public void getAllOrders() {
        System.out.println(orderService.getOrderByNumber("BIZ20240125090949577273"));
    }
    @Test
    public void getOrdersByStatus() {
        System.out.println(orderService.getOrdersByState(OrderState.PROCESSING,1,3));
    }


    @Test
    public void addOrder() {
        orderService.getOrderByNumberAndUserId("BIZ20240125090949577273",8);

    }

    @Test
    public void updateOrder() {
        orderService.updateOrderAddr(1,"测试地址");
    }

    @Test
    public void deleteOrder() {
        String s = "CANCELED";
        try{
            OrderState orderState = Enum.valueOf(OrderState.class,s);
            System.out.println();
        }catch (Exception e){
            System.out.println("match fail");
            e.printStackTrace();
        }
    }
}