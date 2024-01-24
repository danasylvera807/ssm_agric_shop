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
        System.out.println(orderService.getOrdersByUserId(1,1,3));
    }

    @Test
    public void getAllOrders() {

    }
    @Test
    public void getOrdersByStatus() {
        System.out.println(orderService.getOrdersByStatus(OrderState.COMPLETED,1,1));
    }


    @Test
    public void addOrder() {


    }

    @Test
    public void updateOrder() {
        orderService.updateOrderAddr(1,"测试地址");
        orderService.updateOrderState(1,OrderState.CANCELED);
    }

    @Test
    public void deleteOrder() {
        String s = "CANCELED";
        try{
            OrderState orderState = Enum.valueOf(OrderState.class,s);
            System.out.println(orderState.getStatus());
        }catch (Exception e){
            System.out.println("match fail");
            e.printStackTrace();
        }
    }
}