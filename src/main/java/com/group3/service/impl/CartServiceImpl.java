package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.group3.mapper.CartMapper;
import com.group3.mapper.ProductMapper;
import com.group3.pojo.Cart;
import com.group3.pojo.Product;
import com.group3.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// CartServiceImpl.java

@Service
public class CartServiceImpl implements CartService {
    private final CartMapper cartMapper;
    private final ProductMapper productMapper;
    @Autowired
    public CartServiceImpl(CartMapper cartMapper, ProductMapper productMapper) {
        this.cartMapper = cartMapper;
        this.productMapper = productMapper;
    }

    /**
     * 加入购物车，商品数量默认为1
     *
     * @param userId
     * @param productId
     * @return
     */
    @Override
    public int addProductToCart(int userId, int productId) {
        Product product = productMapper.getProductById(productId);
        int stock = product.getProductStock();
        if(stock > 0){
            return cartMapper.addProductToCart(userId, productId, 1, LocalDateTimeUtil.now());
        }else{//库存不足
            return -1;
        }
    }

    @Override
    public void updateCartItemQuantity(int userId, int productId,int quantity) {
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

