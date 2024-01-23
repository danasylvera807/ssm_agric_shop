package com.group3.enums;

public enum UserIdentity {
    CUSTOMER("顾客"),
    ADMIN("管理员");

    private final String identity;

    UserIdentity(String identity) {
        this.identity = identity;
    }

    public String getIdentity() {
        return identity;
    }
}
