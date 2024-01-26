package com.group3.service;

import com.group3.pojo.Category;

import java.util.List;

public interface CategoryService {

    Category getCategoryById(int categoryId);

    List<Category> getAllCategories();

    int addCategory(Category category);

    int updateCategory(Category category);

    int deleteCategory(int categoryId);
}

