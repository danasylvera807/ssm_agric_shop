package com.group3.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.group3.enums.OrderState;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int orderId;
    private String orderNumber;
    private User orderUser;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime orderTime;//订单生成时间
    private OrderState orderState;//订单状态
    private double orderTotalAmount;//总金额
    private String shippingAddress;//发货地址
    private String logisticInfo;//物流信息
}
