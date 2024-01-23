package com.group3.enums;

import org.junit.Test;

public class OrderStateTest {

    @Test
    public void getStatus() {
        System.out.println(OrderState.CANCELED.getStatus().toString());
        System.out.println(OrderState.COMPLETED.toString());
    }
}