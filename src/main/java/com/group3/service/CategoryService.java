package com.group3.service;

import com.group3.pojo.Category;

import java.util.List;

public interface CategoryService {

    Category getCategoryById(int categoryId);

    List<Category> getAllCategories();

    void addCategory(Category category);

    void updateCategory(Category category);

    void deleteCategory(int categoryId);
}

