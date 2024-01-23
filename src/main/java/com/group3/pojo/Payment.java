package com.group3.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime paymentTime;
    private double paymentTotalAmount;
    private PaymentMethod paymentMethod;
}
