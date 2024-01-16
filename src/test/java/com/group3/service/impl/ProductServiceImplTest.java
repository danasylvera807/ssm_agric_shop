package com.group3.service.impl;

import com.github.pagehelper.PageInfo;
import com.group3.pojo.Product;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

public class ProductServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    ProductServiceImpl productService =(ProductServiceImpl) context.getBean("productServiceImpl");
    PageInfo<Product> pageInfo;
    Product product = new Product();
    @Test
    public void getProductByPage() {

    }

    @Test
    public void getProductByName() {
        System.out.println(productService.getProductByName("苹果", 1, 2));
    }

    @Test
    public void getProductsByCategoryId() {
        pageInfo = productService.getProductsByCategoryId(1,2,10);
        for (Product p :
                pageInfo.getList()) {
            System.out.println(p);
        }
    }

    @Test
    public void addProduct() {
        product.setProductName("苹果1");
        product.setCategoryId(1);
        System.out.println(productService.addProduct(product));
    }

    @Test
    public void updateProduct() {
        product.setProductId(4);
        product.setProductName("苹果2");
        product.setCategoryId(1);
        System.out.println(productService.updateProduct(product));
    }

    @Test
    public void deleteProduct() {
        System.out.println(productService.deleteProduct(4));
    }
}