package com.group3.enums;

public enum OrderState {
    PENDING_PAYMENT("待支付"),
    PROCESSING("待发货"),
    SHIPPED("已发货"),
    DELIVERED("已送达"),
    COMPLETED("已完成");

    private final String state;

    OrderState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public OrderState changeState(){
        OrderState o ;
        switch (this){
            case PENDING_PAYMENT:
                o = PROCESSING;
                break;
            case PROCESSING:
                o = SHIPPED;
                break;
            case SHIPPED:
                o = DELIVERED;
                break;
            case DELIVERED:
                o = COMPLETED;
                break;
            default:
                o = COMPLETED;
        }
        return o;
    }
}

