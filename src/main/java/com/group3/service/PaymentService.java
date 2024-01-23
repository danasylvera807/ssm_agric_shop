package com.group3.service;

// PaymentService.java

import com.group3.pojo.Payment;

import java.util.List;

public interface PaymentService {

    Payment getPaymentById(int paymentId);

    List<Payment> getAllPayments();

    void addPayment(Payment payment);

    void updatePayment(Payment payment);

    void deletePayment(int paymentId);
}

