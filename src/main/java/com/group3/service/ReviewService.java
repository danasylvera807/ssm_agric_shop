package com.group3.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.group3.pojo.Review;

import java.util.List;

public interface ReviewService {
    List<Review> getAllReviews();
    PageInfo<Review> getReviewsByProductId(int productId, int pageNum, int pageSize);
    void addReview(int user_id,int product_id,String content,int rating);

    void deleteReview(int reviewId);
}
