package com.group3.controller;

import com.group3.pojo.User;
import com.group3.service.UserService;
import com.group3.utils.VerifyHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class UserController {
    private final UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("login")
    public String login(){
        return "user/login";
    }

    @PostMapping(value = "loginByPwd", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String loginByPwd(@RequestParam String userName,
                             @RequestParam String userPwd,
                             @RequestParam String captchaCode,
                             Model model
                             ){
        if(!userService.pwdLogin(userName,userPwd)){
            return "user error";//用户名或密码错误
        }else if(!(captchaCode.equals(VerifyHelper.getCode()))){
            return "code error";//验证码错误
        }else {
            return userService.getByUserName(userName).getUserIdentity().getIdentity();
        }
    }

    @GetMapping("register")
    public String register(){
        return "user/register";
    }

    @PostMapping(value = "registerAction", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String registerAction(@RequestParam String userName,
                                 @RequestParam String userPwd
                                 ){
        int res = userService.register(userName, userPwd);
        if(res > 0){
            return "success";
        }else if(res == 0){
            return "fail";
        }else{
            return "repeat";
        }

    }


    @RequestMapping(value = "/captcha", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<byte[]> generateCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ResponseEntity<byte[]> response1 = VerifyHelper.graphVerify(request,response);
        System.out.println(VerifyHelper.getCode());
        return response1;
    }
    @GetMapping("/")
    public RedirectView redirectToShop() {
        return new RedirectView("/agricshop.do", true);
    }
    @GetMapping("agricshop")
    public String shopWithoutUser(Model model){
        return "main/customer";
    }@GetMapping("shop")
    public String shopWithUser(@RequestParam String userName,Model model){
        model.addAttribute("user",userService.getByUserName(userName));
        return "main/customer";
    }
    @GetMapping("manage")
    public String manage(@RequestParam String userName,Model model){
        model.addAttribute("user",userService.getByUserName(userName));
        return "main/admin";
    }
    @GetMapping("pwdLogin")
    public String pwdLogin(){
        return "user/verifyByPwd";
    }
    @GetMapping("msgLogin")
    public String msgLogin(){
        return "user/verifyByPhone";
    }
    @GetMapping("getUserByName")
    @ResponseBody
    public User getUserByName(@RequestParam String userName){
        return userService.getByUserName(userName);
    }
}
