package com.group3.utils;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.group3.enums.UserIdentity;
import org.junit.Test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDateTime;

import static org.junit.Assert.*;

public class TimeUtilsTest {

    @Test
    public void timeToString() {
        System.out.println(UserIdentity.CUSTOMER.toString());
    }

    @Test
    public void stringToTime() {
        System.out.println(LocalDateTimeUtil.parse("2022-02-11", "yyyy-MM-dd"));
    }

    @Test
    public void dateToString() throws UnsupportedEncodingException {
        String originalFileName = "2024-01-21T14:45:11.2112edc5a75-c24c-4aff-b016-00bee4414747.jpg";

        try {
            // 使用 URLEncoder 编码文件名
            String encodedFileName = URLEncoder.encode(originalFileName, "UTF-8");

            // 输出编码后的文件名
            System.out.println(encodedFileName);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void stringToDate() throws IOException {
        OSSHelper.delete("2024-01-21T22:36:56.2786e3d9752-7440-4af3-ad66-9deca566dcfd.jpg");
    }
}