package com.group3.mapper;

import com.group3.enums.OrderState;
import com.group3.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    // 根据id查询单个订单信息
    Order getOrderById(@Param("orderId") int orderId);
    //根据订单号查询单个订单信息
    Order getOrderByNumber(@Param("orderNumber") String orderNumber);
    // 查询某用户的所有订单
    List<Order> getOrdersByUserId(@Param("userId") int userId);

    // 查询所有订单
    List<Order> getAllOrders();
    //根据订单状态查询
    List<Order> getOrdersByStatus(@Param("orderStatus") OrderState orderState);

    // 添加订单
    int addOrder(Order order);

    // 更新订单信息
    int updateOrder(Order order);
    int updateOrderState(@Param("orderId") int orderId, @Param("orderState") OrderState orderState);
    int updateOrderAddr(@Param("orderId") int orderId, @Param("shippingAddress") String shippingAddress);

    // 删除订单
    int deleteOrder(@Param("orderId") int orderId);
}
