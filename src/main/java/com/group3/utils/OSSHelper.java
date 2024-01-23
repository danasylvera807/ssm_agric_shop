package com.group3.utils;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.URLEncoder;
import java.util.UUID;

public class OSSHelper {
    private final static String endpoint = "https://oss-cn-hangzhou.aliyuncs.com";
    private final static String accessKeyId = "LTAI5tKPLA5v2TurNYCpsAcn";
    private final static String accessKeySecret = "lxxa0dlRNHxbKiBSryW2DDoNgJpg5b";
    private final static String bucketName = "sk308465";
    private final static String dirName = "img/";

    public static void upload(MultipartFile multipartFile,String fileName) throws IOException {
        // 创建OSSClient实例
        OSS ossClient = new OSSClientBuilder().build(endpoint,accessKeyId,accessKeySecret);
        //上传文件
        try {
            ossClient.putObject(bucketName, dirName+fileName,multipartFile.getInputStream());
            System.out.println("==> file upload success");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("==> file upload fail");
        } finally {
            // 关闭 OSS 客户端
            ossClient.shutdown();
        }
    }
    public static void delete(String fileName) throws IOException {
        // 创建OSSClient实例
        OSS ossClient = new OSSClientBuilder().build(endpoint,accessKeyId,accessKeySecret);
        try {
            // 删除文件
            ossClient.deleteObject(bucketName, dirName+fileName);
            System.out.println("==> file delete success");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("==> file delete fail");
        } finally {
            // 关闭 OSS 客户端
            ossClient.shutdown();
        }
    }

    public static String getFileName(MultipartFile multipartFile) throws UnsupportedEncodingException {
        String oldFileName = multipartFile.getOriginalFilename();
        int i = oldFileName.lastIndexOf(".");
        String suffix = oldFileName.substring(i);
        String newFileName = LocalDateTimeUtil.now().toString()+UUID.randomUUID() + suffix;
        return newFileName;
    }



}
