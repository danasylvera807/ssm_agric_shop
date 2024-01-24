package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.enums.OrderState;
import com.group3.mapper.CartMapper;
import com.group3.mapper.OrderMapper;
import com.group3.mapper.UserMapper;
import com.group3.pojo.Cart;
import com.group3.pojo.Order;
import com.group3.service.OrderService;
import com.group3.utils.OrderNumberGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    private final OrderMapper orderMapper;
    private final CartMapper cartMapper;
    private final UserMapper userMapper;
    @Autowired
    public OrderServiceImpl(OrderMapper orderMapper, CartMapper cartMapper, UserMapper userMapper) {
        this.orderMapper = orderMapper;
        this.cartMapper = cartMapper;
        this.userMapper = userMapper;
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

    /**
     * 生成订单成功则返回订单号
     *
     * @param userId
     * @return
     */
    public Order createOrder(Integer userId) {
        //生成订单号
        String orderNumber = OrderNumberGenerator.generateOrderNumber();
        //计算金额
        double orderTotalAmount = 0;
        List<Cart> cartList = cartMapper.getCartItemsByUserId(userId);
        for (Cart c :
                cartList) {
            orderTotalAmount += c.getQuantity() * c.getCartProduct().getProductPrice();
        }
        System.out.println(orderTotalAmount);
        //生成订单对象，装填属性
        Order order = new Order();
        order.setOrderUser(userMapper.getByUserId(userId));
        order.setOrderTotalAmount(orderTotalAmount);
        order.setOrderNumber(orderNumber);
        order.setOrderState(OrderState.PROCESSING);
        order.setOrderTime(LocalDateTimeUtil.now());
        order.setShippingAddress("江苏南通如皋万寿路人才公寓17号楼");
        return order;

    }

    @Override
    public int addOrder(Order order) {
        //添加订单
        int addRes = orderMapper.addOrder(order);
        if(addRes > 0){
            //删除该用户所有购物车
            int deleteRes = cartMapper.clearCartByUserId(order.getOrderUser().getUserId());
            return deleteRes;
        }else{
            return addRes;
        }
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
