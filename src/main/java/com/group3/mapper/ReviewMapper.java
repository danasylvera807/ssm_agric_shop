package com.group3.mapper;

// ReviewMapper.java

import com.group3.pojo.Review;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReviewMapper {

    List<Review> getAllReviews();
    List<Review> getReviewsByProductId(@Param("productId") int productId);
    void addReview(Review review);
    void deleteReview(@Param("reviewId") int reviewId);

}

