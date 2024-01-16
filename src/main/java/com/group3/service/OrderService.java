package com.group3.service;

import com.github.pagehelper.PageInfo;
import com.group3.enums.OrderStatus;
import com.group3.pojo.Order;
import org.apache.ibatis.annotations.Param;


public interface OrderService {
    // 查询单个订单信息
    Order getOrderById(int orderId);

    // 查询某用户的所有订单
    PageInfo<Order> getOrdersByUserId(int userId, int pageNum, int pageSize);

    // 查询所有订单
    PageInfo<Order> getAllOrders(int pageNum,int pageSize);
    //根据状态查询订单
    PageInfo<Order> getOrdersByStatus(OrderStatus orderStatus,int pageNum,int pageSize);

    // 添加订单
    void addOrder(Order order);

    // 更新订单信息
    void updateOrder(Order order);

    // 删除订单
    void deleteOrder(int orderId);
}
