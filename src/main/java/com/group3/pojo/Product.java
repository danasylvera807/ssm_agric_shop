package com.group3.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int productId;
    private String productName;
    private String productDescription;
    private double productPrice;
    private int productStock;
    private String productImageUrl;
    private String productOrigin;
    private LocalDate productProductionDate;
    private int categoryId;
}
