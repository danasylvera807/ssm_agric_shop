package com.group3.controller;

import com.group3.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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
    @GetMapping("customer/cart")
    public String cart(){
        return "cart/list";
    }
    @GetMapping("cart/list")
    @ResponseBody
    public Map<String,Object> getProductData(@RequestParam Integer userId,
                                             @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
                                             @RequestParam(name = "pageSize", defaultValue = "5") int pageSize) {
        return cartService.getCartItemsByUserId(userId, pageNum, pageSize);
    }

    @GetMapping("cart/toUpdate")
    public String toUpdate(@RequestParam Integer cartId, Model model){
        model.addAttribute("cart",cartService.getCartById(cartId));
        return "cart/update";
    }
    @RequestMapping(value = "cart/update", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String update(@RequestParam Integer cartId,
                         @RequestParam Integer quantity){
        int res = cartService.updateCartItemQuantity(cartId,quantity);
        if(res > 0){
            return "修改数量成功";
        }else if(res == 0){
            return "修改失败";
        }else{
            return "库存不足";
        }
    }
    @GetMapping(value = "cart/delete", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String delete(@RequestParam Integer cartId){
        if(cartService.deleteCartById(cartId)>0){
            return "success";
        }else{
            return "error";
        }
    }
}
