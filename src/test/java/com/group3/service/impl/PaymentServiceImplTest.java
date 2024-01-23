package com.group3.service.impl;

import com.group3.enums.PaymentMethod;
import com.group3.pojo.Order;
import com.group3.pojo.Payment;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class PaymentServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    PaymentServiceImpl paymentService =(PaymentServiceImpl) context.getBean("paymentServiceImpl");

    @Test
    public void getPaymentById() {
        System.out.println(paymentService.getPaymentById(1));
    }

    @Test
    public void getAllPayments() {
        for (Payment p :
                paymentService.getAllPayments()) {
            System.out.println(p);
        }
    }

    @Test
    public void addPayment() {
        Payment payment = new Payment();
        payment.setPaymentMethod(PaymentMethod.WECHAT);
        Order order = new Order();
        order.setOrderId(2);
        payment.setPaymentOrder(order);
        payment.setPaymentTotalAmount(200);
        paymentService.addPayment(payment);
    }

    @Test
    public void updatePayment() {
    }

    @Test
    public void deletePayment() {
    }
}