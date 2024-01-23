package com.group3.mapper;

// PaymentMapper.java

import com.group3.pojo.Payment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PaymentMapper {

    // 根据支付ID查询支付信息
    Payment getPaymentById(@Param("paymentId") int paymentId);

    // 查询所有支付信息
    List<Payment> getAllPayments();

    // 添加新支付信息
    int addPayment(Payment payment);

    // 更新支付信息
    int updatePayment(Payment payment);

    // 删除支付信息
    int deletePayment(@Param("paymentId") int paymentId);
}

