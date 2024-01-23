package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.group3.mapper.CartMapper;
import com.group3.pojo.Cart;
import com.group3.service.CartService;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// CartServiceImpl.java

@Service
public class CartServiceImpl implements CartService {

    private final CartMapper cartMapper;

    @Autowired
    public CartServiceImpl(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Override
    public void addProductToCart(int userId, int productId, int quantity) {
        cartMapper.addProductToCart(userId, productId, quantity, LocalDateTimeUtil.now());
    }

    @Override
    public void updateCartItemQuantity(int userId, int productId, int quantity) {
        cartMapper.updateCartItemQuantity(userId, productId, quantity,LocalDateTimeUtil.now());
    }

    @Override
    public void removeProductFromCart(int userId, int productId) {
        cartMapper.removeProductFromCart(userId, productId);
    }

    @Override
    public List<Cart> getCartItemsByUserId(int userId) {
        return cartMapper.getCartItemsByUserId(userId);
    }

    @Override
    public void clearCartByUserId(int userId) {
        cartMapper.clearCartByUserId(userId);
    }
}

