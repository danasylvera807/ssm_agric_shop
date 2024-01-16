package com.group3.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
    private int cartId;
    private User cartUser;
    private Product cartProduct;
    private int cartProductQuantity;
    private LocalDateTime cartTime;
}
