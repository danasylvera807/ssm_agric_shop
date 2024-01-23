package com.group3.service.impl;

import com.group3.pojo.Category;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class CategoryServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    CategoryServiceImpl categoryService =(CategoryServiceImpl) context.getBean("categoryServiceImpl");

    @Test
    public void getCategoryById() {
        System.out.println(categoryService.getCategoryById(1));
    }

    @Test
    public void getAllCategories() {
        for (Category c:
                categoryService.getAllCategories()) {
            System.out.println(c);
        }
    }

    @Test
    public void addCategory() {
        Category category = new Category();
        category.setCategoryName("肉类");
        categoryService.addCategory(category);
    }

    @Test
    public void updateCategory() {
        Category category = new Category();
        category.setCategoryId(3);
        category.setCategoryName("鸡肉类");
        categoryService.updateCategory(category);
    }

    @Test
    public void deleteCategory() {
        categoryService.deleteCategory(3);
    }
}