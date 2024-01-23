package com.group3.mapper;

import com.group3.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface CartMapper {

    // 添加商品到购物车
    int addProductToCart(@Param("userId") int userId, @Param("productId") int productId, @Param("quantity") int quantity,@Param("cartTime") LocalDateTime cartTime);

    // 更新购物车中商品的数量
    int updateCartItemQuantity(@Param("userId") int userId, @Param("productId") int productId, @Param("quantity") int quantity,@Param("cartTime") LocalDateTime cartTime);

    // 从购物车中移除商品
    int removeProductFromCart(@Param("userId") int userId, @Param("productId") int productId);

    // 获取用户购物车中的所有商品
    List<Cart> getCartItemsByUserId(@Param("userId") int userId);

    // 清空用户购物车
    int clearCartByUserId(@Param("userId") int userId);
}
