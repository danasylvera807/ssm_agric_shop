package com.group3.pojo;

import com.group3.enums.PaymentMethod;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    private int paymentId;
    private Order paymentOrder;
    private LocalDateTime paymentTime;
    private double paymentTotalAmount;
    private PaymentMethod paymentMethod;
}
