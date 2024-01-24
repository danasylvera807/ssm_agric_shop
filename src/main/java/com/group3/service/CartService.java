package com.group3.service;

import com.group3.pojo.Cart;

import java.util.List;

public interface CartService {

    boolean addProductToCart(int userId, int productId);

    void updateCartItemQuantity(int userId, int productId,int quantity);

    void removeProductFromCart(int userId, int productId);

    List<Cart> getCartItemsByUserId(int userId);

    void clearCartByUserId(int userId);
}

