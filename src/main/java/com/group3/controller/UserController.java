package com.group3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    @GetMapping("login")
    public String login(){
        return "login";
    }

    @PostMapping("loginAction")
    public String loginAction(){

        return "customer/main";
    }

    @GetMapping("register")
    public String register(){
        return "login";
    }

    @PostMapping("registerAction")
    public String registerAction(){

        return "login";
    }



}
