package com.group3.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.group3.pojo.Product;

import java.util.Map;

public interface ProductService {
    //模糊查询：根据产品名称查询
    public PageInfo<Product> getProductByName(String phoneNumber, int pageNo, int pageSize);
    //查询：根据分类查询产品
    public PageInfo<Product> getProductsByCategoryId(int categoryId, int pageNo, int pageSize);
    // 添加新产品
    public boolean addProduct(Product product);
    // 更新产品信息
    public boolean updateProduct(Product product);
    // 删除产品
    public boolean deleteProduct(int productId);
}
