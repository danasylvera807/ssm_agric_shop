package com.group3.service.impl;

import com.group3.mapper.CategoryMapper;
import com.group3.service.CategoryService;
import lombok.Setter;

// CategoryServiceImpl.java

import com.group3.mapper.CategoryMapper;
import com.group3.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    private final CategoryMapper categoryMapper;

    @Autowired
    public CategoryServiceImpl(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
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
    public void addCategory(Category category) {
        categoryMapper.addCategory(category);
    }

    @Override
    public void updateCategory(Category category) {
        categoryMapper.updateCategory(category);
    }

    @Override
    public void deleteCategory(int categoryId) {
        categoryMapper.deleteCategory(categoryId);
    }
}

