package com.group3.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.mapper.ProductMapper;
import com.group3.pojo.Product;
import com.group3.service.ProductService;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Setter
@Getter
public class ProductServiceImpl implements ProductService {
    private ProductMapper productMapper;

    @Override
    public PageInfo<Product> getProductByName(String keyword, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Product> productList = productMapper.getProductsByKeyword(keyword);
        return new PageInfo<>(productList);
    }

    @Override
    public PageInfo<Product> getProductsByCategoryId(int categoryId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Product> productList = productMapper.getProductsByCategoryId(categoryId);
        return new PageInfo<>(productList);
    }

    @Override
    public boolean addProduct(Product product) {
        return productMapper.addProduct(product) > 0;
    }

    @Override
    public boolean updateProduct(Product product) {
        return productMapper.updateProduct(product) > 0;
    }

    @Override
    public boolean deleteProduct(int productId) {
        return productMapper.deleteProduct(productId) > 0;
    }
}
