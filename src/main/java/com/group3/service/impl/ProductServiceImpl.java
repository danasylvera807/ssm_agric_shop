package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.mapper.ProductMapper;
import com.group3.pojo.Product;
import com.group3.service.ProductService;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {
    private final ProductMapper productMapper;
    @Autowired
    public ProductServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public Product getProductById(int productId) {
        return productMapper.getProductById(productId);
    }

    @Override
    public Map<String,Object> getProductsByName(String keyword, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<Product> pageInfo = new PageInfo<>(productMapper.getProductsByKeyword(keyword));
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return map;
    }

    @Override
    public Map<String,Object> getProductsByCategoryId(int categoryId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<Product> pageInfo = new PageInfo<>(productMapper.getProductsByCategoryId(categoryId));
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        //System.out.println(pageInfo.getList());
        return map;
    }

    @Override
    public Map<String, Object> getAllProducts(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        PageInfo<Product> pageInfo = new PageInfo<>(productMapper.getAllProducts());
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        //System.out.println(pageInfo.getList());
        return map;
    }

    @Override
    public boolean addProduct(Product product) {
        product.setProductProductionDate(LocalDateTimeUtil.now().toLocalDate());
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
