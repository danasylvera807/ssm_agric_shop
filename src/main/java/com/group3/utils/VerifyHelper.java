package com.group3.utils;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.CircleCaptcha;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class VerifyHelper {
    private static String code = null;

    /**
     * 输入手机号，发送验证码，并返回用于验证
     * @param phoneNumber
     * @return
     */
    public static String messageVerify(String phoneNumber){

        return null;
    }

    /**生成图形，返回验证码
     *
     * @return
     */
    public static ResponseEntity<byte[]> graphVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CircleCaptcha captcha = CaptchaUtil.createCircleCaptcha(200, 100, 4, 20);
        BufferedImage image = captcha.getImage();
        //获取验证码
        code = captcha.getCode();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(image, "jpeg", outputStream);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);
        return new ResponseEntity<>(outputStream.toByteArray(), headers, HttpStatus.OK);
    }

    public static String getCode() {
        return code;
    }
}
