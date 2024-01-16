package com.group3.enums;

import org.junit.Test;

import static org.junit.Assert.*;

public class OrderStatusTest {

    @Test
    public void getStatus() {
        System.out.println(OrderStatus.CANCELED.getStatus().toString());
        System.out.println(OrderStatus.COMPLETED.toString());
    }
}