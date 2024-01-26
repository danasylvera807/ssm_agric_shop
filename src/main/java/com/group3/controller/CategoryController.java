package com.group3.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.pojo.Category;
import com.group3.pojo.Product;
import com.group3.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CategoryController {
    private final CategoryService categoryService;


    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
    @RequestMapping("admin/category")
    public String category(){
        return "category/list";
    }
    @RequestMapping("category/list")
    @ResponseBody
    public Map<String,Object> list(){
        List<Category> categoryList = categoryService.getAllCategories();
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","success");
        map.put("count",categoryList.size());
        map.put("data",categoryList);
        return map;
    }
    @RequestMapping("category/toUpdate")
    public String toUpdate(@RequestParam Integer categoryId, Model model){
        model.addAttribute(categoryId);
        return "category/update";
    }
    @RequestMapping("category/update")
    @ResponseBody
    public String update(@RequestParam Integer categoryId,@RequestParam String categoryName){
        Category category = new Category(categoryId,categoryName);
        if(categoryService.updateCategory(category)>0){
            return "success";
        }else{
            return "error";
        }
    }

    @RequestMapping("category/toAdd")
    public String toAdd(){
        return "category/add";
    }
    @RequestMapping("category/add")
    @ResponseBody
    public String add(@RequestParam String categoryName){
        Category category = new Category();
        category.setCategoryName(categoryName);
        if(categoryService.addCategory(category)>0){
            return "success";
        }else{
            return "error";
        }
    }
    @RequestMapping("category/delete")
    @ResponseBody
    public int delete(@RequestParam Integer categoryId){
        int res = categoryService.deleteCategory(categoryId);
        return res;
    }
}
