package com.group3.mapper;

import com.group3.pojo.Category;
import com.group3.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    public Product getProductById(@Param("productId") int productId);
    public List<Product> getAllProducts();
    public List<Product> getProductsByKeyword(@Param("keyword") String keyword);
    public List<Product> getProductsByCategoryId(@Param("categoryId") int categoryId);
    public int addProduct(Product product);
    public int updateProduct(Product product);
    public int deleteProduct(@Param("productId") int productId);

}
