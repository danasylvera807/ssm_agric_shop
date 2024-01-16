package com.group3.pojo;

import com.group3.enums.OrderStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int orderId;
    private User orderUser;
    private LocalDateTime orderTime;//订单生成时间
    private OrderStatus orderStatus;//订单状态
    private double orderTotalAmount;//总金额
    private String shippingAddress;//发货地址
    private String logisticInfo;//物流信息
}
