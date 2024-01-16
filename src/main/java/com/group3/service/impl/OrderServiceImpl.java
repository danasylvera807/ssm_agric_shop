package com.group3.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.enums.OrderStatus;
import com.group3.mapper.OrderMapper;
import com.group3.pojo.Order;
import com.group3.service.OrderService;
import lombok.Setter;

import java.util.List;

@Setter
public class OrderServiceImpl implements OrderService {
    private OrderMapper orderMapper;

    public Order getOrderById(int orderId) {
        return orderMapper.getOrderById(orderId);
    }

    public PageInfo<Order> getOrdersByUserId(int userId,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Order> orderList = orderMapper.getOrdersByUserId(userId);
        return new PageInfo<>(orderList);
    }

    public PageInfo<Order> getAllOrders(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Order> orderList = orderMapper.getAllOrders();
        return new PageInfo<>(orderList);
    }

    @Override
    public PageInfo<Order> getOrdersByStatus(OrderStatus orderStatus,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Order> orderList = orderMapper.getOrdersByStatus(orderStatus);
        return new PageInfo<>(orderList);
    }

    public void addOrder(Order order) {


        orderMapper.addOrder(order);
    }

    public void updateOrder(Order order) {
        orderMapper.updateOrder(order);
    }

    public void deleteOrder(int orderId) {
        orderMapper.deleteOrder(orderId);
    }
}
