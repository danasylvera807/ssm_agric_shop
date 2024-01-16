package com.group3.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private int reviewId;
    private User reviewUser;
    private Product reviewProduct;
    private String reviewContent;
    private LocalDateTime reviewTime;
    private int reviewRating;
}
