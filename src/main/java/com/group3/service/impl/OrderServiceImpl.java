package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.enums.OrderState;
import com.group3.mapper.OrderMapper;
import com.group3.pojo.Order;
import com.group3.service.OrderService;
import com.group3.utils.OrderNumberGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    private final OrderMapper orderMapper;
    @Autowired
    public OrderServiceImpl(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    public Order getOrderById(int orderId) {
        return orderMapper.getOrderById(orderId);
    }

    public Map<String,Object> getOrdersByUserId(int userId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<Order> pageInfo = new PageInfo<>(orderMapper.getOrdersByUserId(userId));
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return map;
    }

    public Map<String,Object> getAllOrders(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<Order> pageInfo = new PageInfo<>(orderMapper.getAllOrders());
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return map;
    }

    @Override
    public Map<String,Object> getOrdersByStatus(OrderState orderState,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<Order> pageInfo = new PageInfo<>(orderMapper.getOrdersByStatus(orderState));
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return map;
    }

    @Override
    public Order getOrderByNumber(String orderNumber) {
        return orderMapper.getOrderByNumber(orderNumber);
    }

    public boolean addOrder(Order order) {
        order.setOrderNumber(OrderNumberGenerator.generateOrderNumber());
        order.setOrderState(OrderState.PROCESSING);
        order.setOrderTime(LocalDateTimeUtil.now());
        return orderMapper.addOrder(order)>0;
    }

    @Override
    public boolean updateOrderAddr(int orderId, String addr) {
        return orderMapper.updateOrderAddr(orderId,addr)>0;
    }

    @Override
    public boolean updateOrderState(int orderId, OrderState orderState) {
        return orderMapper.updateOrderState(orderId,orderState)>0;
    }


    public boolean deleteOrder(int orderId) {
        return orderMapper.deleteOrder(orderId)>0;
    }
}
