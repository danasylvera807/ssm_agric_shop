package com.group3.service;

import com.group3.pojo.Cart;

import java.util.Map;

public interface CartService {

    int addProductToCart(int userId, int productId);

    int updateCartItemQuantity(int cartId,int quantity);

    int deleteCartById(int cartId);

    Map<String, Object> getCartItemsByUserId(Integer userId,Integer pageNum,Integer pageSize);

    int clearCartByUserId(int userId);

    Cart getCartById(Integer cartId);
}

