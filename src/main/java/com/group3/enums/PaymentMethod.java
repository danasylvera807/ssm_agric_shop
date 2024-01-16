package com.group3.enums;

public enum PaymentMethod {
    WECHAT("微信支付"),
    ALIPAY("支付宝支付");
    private final String method;
    PaymentMethod(String method) {
        this.method = method;
    }

    public String getStatus() {
        return method;
    }
}
