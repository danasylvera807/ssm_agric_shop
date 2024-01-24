package com.group3.service.impl;

import com.group3.pojo.Cart;
import com.group3.pojo.Product;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

import static org.junit.Assert.*;

public class CartServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    CartServiceImpl cartService =(CartServiceImpl) context.getBean("cartServiceImpl");

    @Test
    public void addProductToCart() {
        cartService.addProductToCart(1,1);
    }

    @Test
    public void updateCartItemQuantity() {
        cartService.updateCartItemQuantity(123,4);
    }

    @Test
    public void removeProductFromCart() {
        cartService.deleteCartById(1);
    }

    @Test
    public void getCartItemsByUserId() {
        //计算金额

    }

    @Test
    public void clearCartByUserId() {
        cartService.clearCartByUserId(1);
    }

    @Test
    public void getCartById() {
        System.out.println(cartService.getCartById(123));
    }
}