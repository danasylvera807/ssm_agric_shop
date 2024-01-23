package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.group3.mapper.ReviewMapper;
import com.group3.pojo.Product;
import com.group3.pojo.User;
import com.group3.service.ReviewService;

// ReviewServiceImpl.java

import com.group3.pojo.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;

    @Autowired
    public ReviewServiceImpl(ReviewMapper reviewMapper) {
        this.reviewMapper = reviewMapper;
    }

    @Override
    public List<Review> getAllReviews() {
        return reviewMapper.getAllReviews();
    }
    @Override
    public PageInfo<Review> getReviewsByProductId(int productId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Review> reviewList = reviewMapper.getReviewsByProductId(productId);
        return new PageInfo<>(reviewList);
    }
    @Override
    public void addReview(int user_id,int product_id,String content,int rating) {
        Review review = new Review();
        User user = new User();
        user.setUserId(user_id);
        Product product = new Product();
        product.setProductId(product_id);

        review.setReviewUser(user);
        review.setReviewProduct(product);
        review.setReviewRating(rating);
        review.setReviewContent(content);
        review.setReviewTime(LocalDateTimeUtil.now());
        reviewMapper.addReview(review);
    }

    @Override
    public void deleteReview(int reviewId) {
        reviewMapper.deleteReview(reviewId);
    }
}

