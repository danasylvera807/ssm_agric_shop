package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.mapper.CartMapper;
import com.group3.mapper.ProductMapper;
import com.group3.pojo.Cart;
import com.group3.pojo.Product;
import com.group3.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

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
    public int updateCartItemQuantity(int cartId,int quantity) {
        Cart cart = cartMapper.getCartById(cartId);
        if(cart != null){
            Product product = cart.getCartProduct();
            int stock = product.getProductStock();
            if(quantity > stock){//库存不足
                return -1;
            }else{
                return cartMapper.updateCartItemQuantity(cartId,quantity,LocalDateTimeUtil.now());
            }
        }else{
            return 0;
        }

    }

    @Override
    public int deleteCartById(int cartId) {
        return cartMapper.deleteCartById(cartId);
    }

    @Override
    public Map<String, Object> getCartItemsByUserId(Integer userId,Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<Cart> pageInfo = new PageInfo<>(cartMapper.getCartItemsByUserId(userId));
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return map;
    }

    @Override
    public int clearCartByUserId(int userId) {
        return cartMapper.clearCartByUserId(userId);
    }

    @Override
    public Cart getCartById(Integer cartId) {
        return cartMapper.getCartById(cartId);
    }
}

