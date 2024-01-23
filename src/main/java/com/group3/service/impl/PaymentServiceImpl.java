package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.group3.mapper.PaymentMapper;
import com.group3.pojo.Payment;
import com.group3.service.PaymentService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {

    private final PaymentMapper paymentMapper;

    @Autowired
    public PaymentServiceImpl(PaymentMapper paymentMapper) {
        this.paymentMapper = paymentMapper;
    }

    @Override
    public Payment getPaymentById(int paymentId) {
        return paymentMapper.getPaymentById(paymentId);
    }

    @Override
    public List<Payment> getAllPayments() {
        return paymentMapper.getAllPayments();
    }

    @Override
    public void addPayment(Payment payment) {
        payment.setPaymentTime(LocalDateTimeUtil.now());
        paymentMapper.addPayment(payment);
    }

    @Override
    public void updatePayment(Payment payment) {
        paymentMapper.updatePayment(payment);
    }

    @Override
    public void deletePayment(int paymentId) {
        paymentMapper.deletePayment(paymentId);
    }
}

