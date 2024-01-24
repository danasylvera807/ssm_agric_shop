package com.group3.controller;

import com.group3.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class CartController {
    private final CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @RequestMapping(value = "cart/add", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String add(@RequestParam Integer productId,
                      @RequestParam Integer userId
                      ){
        int res = cartService.addProductToCart(userId,productId);
        if(res > 0){
            return "已加入购物车,可在‘购物车’中查看";
        }else if(res == 0){
            return "加入购物车失败";
        }else{
            return "库存不足";
        }
    }




}
