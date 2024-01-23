package com.group3.controller;

import com.group3.pojo.Product;
import com.group3.service.CategoryService;
import com.group3.service.ProductService;
import com.group3.utils.OSSHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Controller
public class ProductController {
    private final CategoryService categoryService;
    private final ProductService productService;

    @Autowired
    public ProductController(CategoryService categoryService, ProductService productService) {
        this.categoryService = categoryService;
        this.productService = productService;
    }
    @RequestMapping("manage")
    public String productManage(Model model){
        model.addAttribute("categoryList",categoryService.getAllCategories());

        return "listToAdmin";
    }
    @GetMapping("admin/product")
    public String productForAdmin(Model model){
        model.addAttribute("categoryList",categoryService.getAllCategories());
        return"product/listToAdmin";
    }
    @GetMapping("getProductsByCategoryId")
    @ResponseBody
    public Map<String,Object> getProductData(@RequestParam int categoryId,
                                             @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
                                             @RequestParam(name = "pageSize", defaultValue = "5") int pageSize) {
        return productService.getProductsByCategoryId(categoryId, pageNum, pageSize);
    }
    @GetMapping("getProductsByName")
    @ResponseBody
    public Map<String,Object> getProductData(@RequestParam String productName,
                                             @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
                                             @RequestParam(name = "pageSize", defaultValue = "5") int pageSize) {
        return productService.getProductsByName(productName, pageNum, pageSize);
    }
    @GetMapping("getAllProducts")
    @ResponseBody
    public Map<String,Object> getProductData(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
                                             @RequestParam(name = "pageSize", defaultValue = "5") int pageSize) {
        return productService.getAllProducts(pageNum, pageSize);
    }
    @GetMapping("product/toAdd")
    public String toAdd(Model model){
        model.addAttribute("categoryList",categoryService.getAllCategories());
        return "product/add";
    }
    @PostMapping(value = "product/add", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String add(@RequestParam String productName,
                      @RequestParam String productDescription,
                      @RequestParam Double productPrice,
                      @RequestParam Integer productStock,
                      @RequestPart MultipartFile file,
                      @RequestParam String productOrigin,
                      @RequestParam Integer categoryId
                      ){
        try {
            //生成新的文件名
            String fileName = OSSHelper.getFileName(file);
            //装填属性
            Product product = new Product();
            product.setProductName(productName);
            product.setProductDescription(productDescription);
            product.setProductPrice(productPrice);
            product.setProductStock(productStock);
            product.setProductImageUrl(fileName);
            product.setProductOrigin(productOrigin);
            product.setCategoryId(categoryId);
            if(productService.addProduct(product)){
                OSSHelper.upload(file,fileName);//上传图片
                return "添加成功";
            }else{
                return "添加失败";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "添加失败";
        }
    }
    @GetMapping("product/toUpdate")
    public String update(@RequestParam Integer productId,Model model){
        model.addAttribute("product",productService.getProductById(productId));
        model.addAttribute("categoryList",categoryService.getAllCategories());
        model.addAttribute("categoryName",categoryService.getCategoryById(productService.getProductById(productId).getCategoryId()).getCategoryName());
        return "product/update";
    }
    @PostMapping(value = "product/update", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String update(@RequestParam Integer productId,
                      @RequestParam String productName,
                      @RequestParam String productDescription,
                      @RequestParam Double productPrice,
                      @RequestParam Integer productStock,
                      @RequestPart MultipartFile file,
                      @RequestParam String productOrigin,
                      @RequestParam Integer categoryId
    ){
        try {
            Product oldProduct = productService.getProductById(productId);
            String oldName = oldProduct.getProductImageUrl();
            String fileName;
            if(file==null){//没有选择文件
                fileName = oldName;
            }else{
                //生成新的文件名
                fileName = OSSHelper.getFileName(file);
            }
            //装填属性
            Product product = new Product();
            product.setProductName(productName);
            product.setProductDescription(productDescription);
            product.setProductPrice(productPrice);
            product.setProductStock(productStock);
            product.setProductImageUrl(fileName);
            product.setProductOrigin(productOrigin);
            product.setCategoryId(categoryId);
            product.setProductId(productId);
            product.setProductProductionDate(oldProduct.getProductProductionDate());
            if(productService.updateProduct(product)){
                OSSHelper.delete(oldName);//删除旧图片
                System.out.println(oldName+"==>delete");
                OSSHelper.upload(file,fileName);//上传图片
                System.out.println(fileName+"==>upload");
                return "更新成功";
            }else{
                return "更新失败";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "更新失败";
        }
    }
    @GetMapping(value = "product/delete", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String delete(@RequestParam Integer productId){
        try {
            String fileName = productService.getProductById(productId).getProductImageUrl();
            OSSHelper.delete(fileName);//删除文件
            productService.deleteProduct(productId);//删除数据库中信息
            return "删除成功";
        }catch (Exception e){
            e.printStackTrace();
            return "删除失败";
        }

    }





}
