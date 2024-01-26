package com.group3.controller;

import com.group3.enums.OrderState;
import com.group3.pojo.Order;
import com.group3.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class OrderController {
    private final OrderService orderService;
    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("admin/order")
    public String adminOrder(Model model){
        model.addAttribute("states", OrderState.values());
        return "order/listToAdmin";
    }
    @GetMapping("customer/order")
    public String customerOrder(Model model){
        model.addAttribute("states", OrderState.values());
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
        if(order == null){//购物车为空，订单未生成

            return "empty cart";
        }
        order.setLogisticInfo(memo);
        if(orderService.addOrder(order)>0){
            return "success";
        }else{
            return "error";
        }

    }
    @RequestMapping("order/listToCustomer")
    @ResponseBody
    public Map<String, Object> listToCustomer(@RequestParam Integer userId,
                                   @RequestParam OrderState orderState,
                                   @RequestParam Integer pageNum,
                                   @RequestParam Integer pageSize){
        return orderService.getOrdersByUserId(userId,orderState,pageNum,pageSize);
    }
    @RequestMapping("order/listToAdmin")
    @ResponseBody
    public Map<String, Object> listToAdmin(@RequestParam OrderState orderState,
                                   @RequestParam Integer pageNum,
                                   @RequestParam Integer pageSize){
        return orderService.getOrdersByState(orderState,pageNum,pageSize);
    }

    @RequestMapping(value = "order/searchForCustomer", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String search(@RequestParam String orderNumber,@RequestParam Integer userId){
        Order order = orderService.getOrderByNumberAndUserId(orderNumber,userId);
        if(order == null){
            return "no such order";
        }else {
            return "success";
        }
    }
    @RequestMapping(value = "order/searchForAdmin", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String searchForAdmin(@RequestParam String orderNumber){
        Order order = orderService.getOrderByNumber(orderNumber);
        if(order == null){
            return "no such order";
        }else {
            return "success";
        }
    }

    @RequestMapping("order/details")
    public String details(@RequestParam String orderNumber,Model model){
        model.addAttribute("order",orderService.getOrderByNumber(orderNumber));
        return "order/details";
    }
    @RequestMapping("order/detailsAndUpdate")
    public String detailsAndUpdate(@RequestParam String orderNumber,Model model){
        model.addAttribute("order",orderService.getOrderByNumber(orderNumber));
        model.addAttribute("states", OrderState.values());
        return "order/details";
    }

    @RequestMapping (value = "order/confirm", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String confirm(@RequestParam Integer orderId){
        if(orderService.updateOrderState(orderId,OrderState.COMPLETED)){
            return "success";
        }else{
            return "error";
        }
    }
    @RequestMapping (value = "order/delete", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String delete(@RequestParam Integer orderId){
        if(orderService.deleteOrder(orderId)){
            return "success";
        }else{
            return "error";
        }
    }
    @RequestMapping (value = "order/handle", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String handle(@RequestParam Integer orderId,@RequestParam OrderState orderState){
        if(orderService.updateOrderState(orderId,orderState.changeState())){
            return "success";
        }else{
            return "error";
        }
    }
    @RequestMapping (value = "order/update", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String update(@RequestParam Integer orderId,@RequestParam OrderState orderState){
        if(orderService.updateOrderState(orderId,orderState)){
            return "success";
        }else{
            return "error";
        }
    }



}
