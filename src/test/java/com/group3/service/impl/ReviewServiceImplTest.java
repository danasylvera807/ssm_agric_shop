package com.group3.service.impl;

import com.group3.pojo.Review;
import com.group3.pojo.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class ReviewServiceImplTest {
    ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    ReviewServiceImpl reviewService =(ReviewServiceImpl) context.getBean("reviewServiceImpl");

    @Test
    public void getAllReviews() {
    }

    @Test
    public void getReviewsByProductId() {
        for (Review r :
                reviewService.getReviewsByProductId(1,1,10).getList() ) {
            System.out.println(r);
        }
    }

    @Test
    public void addReview() {
        reviewService.addReview(1,1,"好好好好好好好",5);

    }

    @Test
    public void deleteReview() {
        reviewService.deleteReview(2);
    }
}