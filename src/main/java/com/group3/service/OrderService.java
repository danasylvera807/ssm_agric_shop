package com.group3.service;

import com.group3.enums.OrderState;
import com.group3.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.Map;


public interface OrderService {
    // 查询单个订单信息
    Order getOrderById(int orderId);

    // 查询某用户的所有订单
    Map<String,Object> getOrdersByUserId(int userId, int pageNum, int pageSize);

    // 查询所有订单
    Map<String,Object> getAllOrders(int pageNum,int pageSize);
    //根据状态查询订单
    Map<String,Object> getOrdersByStatus(OrderState orderState, int pageNum, int pageSize);
    Order getOrderByNumber(String orderNumber);

    // 添加订单
    boolean addOrder(Order order);

    // 更新订单信息
    boolean updateOrderAddr(int orderId, String addr);
    boolean updateOrderState(int orderId, OrderState orderState);


    // 删除订单
    boolean deleteOrder(int orderId);
}
