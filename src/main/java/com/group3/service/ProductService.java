package com.group3.service;

import com.group3.pojo.Product;

import java.util.Map;

public interface ProductService {
    public Product getProductById(int productId);
    //模糊查询：根据产品名称查询
    public Map<String,Object> getProductsByName(String phoneNumber, int pageNum, int pageSize);
    //查询：根据分类查询产品
    public Map<String,Object> getProductsByCategoryId(int categoryId, int pageNum, int pageSize);
    public Map<String,Object> getAllProducts(int pageNum, int pageSize);
    // 添加新产品
    public boolean addProduct(Product product);
    // 更新产品信息
    public boolean updateProduct(Product product);
    // 删除产品
    public boolean deleteProduct(int productId);
    public int deleteProductByCategoryId(int categoryId);
}
