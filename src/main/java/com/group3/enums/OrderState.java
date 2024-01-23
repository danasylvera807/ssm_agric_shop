package com.group3.enums;

public enum OrderState {
    PENDING_PAYMENT("待支付"),
    PROCESSING("处理中"),
    SHIPPED("已发货"),
    DELIVERED("已送达"),
    CANCELED("已取消"),
    COMPLETED("已完成");

    private final String status;

    OrderState(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}

