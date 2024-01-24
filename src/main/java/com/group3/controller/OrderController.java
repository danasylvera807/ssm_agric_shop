package com.group3.controller;

import com.group3.pojo.Order;
import com.group3.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {
    private final OrderService orderService;
    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("admin/order")
    public String adminOrder(){
        return "order/listToAdmin";
    }
    @GetMapping("customer/order")
    public String customerOrder(){
        return "order/listToCustomer";
    }
    @RequestMapping("order/create")
    public String create(@RequestParam Integer userId, Model model){
        model.addAttribute("order",orderService.createOrder(userId));
        return "order/create";
    }
    @RequestMapping(value = "order/add", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String add(@RequestParam Integer userId,
                      @RequestParam String memo){
        Order order = orderService.createOrder(userId);
        order.setLogisticInfo(memo);
        if(orderService.addOrder(order)>0){
            return "下单成功，请前往’我的订单‘支付";
        }else{
            return "下单失败";
        }

    }
}
