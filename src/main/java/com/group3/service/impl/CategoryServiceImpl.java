package com.group3.service.impl;

import com.group3.mapper.CategoryMapper;
import com.group3.mapper.ProductMapper;
import com.group3.service.CategoryService;
import com.group3.service.ProductService;

// CategoryServiceImpl.java

import com.group3.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    private final CategoryMapper categoryMapper;
    private final ProductMapper productMapper;
    @Autowired
    public CategoryServiceImpl(CategoryMapper categoryMapper, ProductService productService, ProductMapper productMapper) {
        this.categoryMapper = categoryMapper;
        this.productMapper = productMapper;
    }

    @Override
    public Category getCategoryById(int categoryId) {
        return categoryMapper.getCategoryById(categoryId);
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryMapper.getAllCategories();
    }

    @Override
    public int addCategory(Category category) {
        return categoryMapper.addCategory(category);
    }

    @Override
    public int updateCategory(Category category) {
        return categoryMapper.updateCategory(category);
    }

    @Override
    public int deleteCategory(int categoryId) {
        int res = productMapper.deleteProductByCategoryId(categoryId);
        if(res > 0){
            if(categoryMapper.deleteCategory(categoryId)>0){
                return res;
            }else{
                return 0;
            }
        }else{
            return res;
        }
    }




}

