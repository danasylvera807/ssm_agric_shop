package com.group3.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class OrderNumberGenerator {

    public static String generateOrderNumber() {
        // 1. 获取当前时间戳
        long timestamp = System.currentTimeMillis();

        // 2. 格式化时间戳为字符串
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String timestampStr = dateFormat.format(new Date(timestamp));

        // 3. 生成随机数（可以根据实际需求调整位数）
        Random random = new Random();
        int randomNum = random.nextInt(1000); // 随机生成0到999之间的数

        // 4. 拼接业务标识（可以根据实际需求调整）
        String businessIdentifier = "BIZ";

        // 5. 组合生成订单号
        String orderNumber = businessIdentifier + timestampStr + String.format("%03d", randomNum);

        return orderNumber;
    }

}
