package com.group3.utils;

import cn.hutool.core.date.LocalDateTimeUtil;
import org.junit.Test;

import java.time.LocalDateTime;

import static org.junit.Assert.*;

public class TimeUtilsTest {

    @Test
    public void timeToString() {

        String format = LocalDateTimeUtil.format(LocalDateTimeUtil.now(), "yyyy-MM-dd");
        System.out.println(format);
        System.out.println(LocalDateTimeUtil.now());
    }

    @Test
    public void stringToTime() {
        System.out.println(LocalDateTimeUtil.parse("2022-02-11", "yyyy-MM-dd"));
    }

    @Test
    public void dateToString() {
    }

    @Test
    public void stringToDate() {
    }
}