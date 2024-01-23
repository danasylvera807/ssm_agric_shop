package com.group3.mapper;

// CategoryMapper.java

import com.group3.pojo.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryMapper {

    // 根据分类ID查询分类
    Category getCategoryById(@Param("categoryId") int categoryId);

    // 查询所有分类
    List<Category> getAllCategories();

    // 添加新分类
    int addCategory(Category category);

    // 更新分类信息
    int updateCategory(Category category);

    // 删除分类
    int deleteCategory(@Param("categoryId") int categoryId);
}

