package com.group3.controller;

import com.group3.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {
    private final OrderService orderService;
    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("admin/order")
    public String order(){
        return "order/listToAdmin";
    }
    @GetMapping("test/orderByState")
    @ResponseBody
    public String getOrderByState(){

        return "";
    }
}
