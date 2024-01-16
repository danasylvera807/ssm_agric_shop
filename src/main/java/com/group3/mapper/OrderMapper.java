package com.group3.mapper;

import com.group3.enums.OrderStatus;
import com.group3.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    // 查询单个订单信息
    Order getOrderById(@Param("orderId") int orderId);

    // 查询某用户的所有订单
    List<Order> getOrdersByUserId(@Param("userId") int userId);

    // 查询所有订单
    List<Order> getAllOrders();
    //根据订单状态查询
    List<Order> getOrdersByStatus(@Param("orderStatus")OrderStatus orderStatus);

    // 添加订单
    void addOrder(Order order);

    // 更新订单信息
    void updateOrder(Order order);

    // 删除订单
    void deleteOrder(@Param("orderId") int orderId);
}
