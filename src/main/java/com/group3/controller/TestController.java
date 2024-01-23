package com.group3.controller;

import com.group3.utils.OSSHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.io.IOException;

@Controller
public class TestController {

    @GetMapping("test/captcha")
    public String captcha(){

        return "test/captcha";
    }
    @GetMapping("test/upload")
    public String upload(){
        return "test/images_upload";
    }
    @PostMapping("test/uploadAction")
    public String uploadAction(@RequestParam MultipartFile photo) throws IOException {
        String name = OSSHelper.getFileName(photo);
        String oldName = "2024-01-22T09:56:35.657393c4abc-8143-4052-9fe4-006958cc8e29.jpg";
        OSSHelper.delete(oldName);
        OSSHelper.upload(photo,name);
        return "test/images_upload";
    }
    @GetMapping("test/table")
    public String table(){
        return "test/table";
    }

    @GetMapping("test/list")
    public String list(){
        return "product/listToAdmin";
    }



}
