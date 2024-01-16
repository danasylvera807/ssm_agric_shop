package com.group3.service.impl;

import com.group3.mapper.UserMapper;
import com.group3.pojo.User;
import com.group3.service.UserService;
import lombok.Setter;

@Setter
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    /**
     * 注册业务实现
     * 用户输入用户名，密码，邮箱或手机号以及验证码
     * @param user
     * @return
     */
    @Override
    public boolean register(User user) {


        return false;
    }

    @Override
    public int add(User user) {
        return userMapper.add(user);
    }

    @Override
    public int delete(int userId) {
        return userMapper.delete(userId);
    }

    @Override
    public int update(User user) {
        return userMapper.update(user);
    }

    @Override
    public User getByUserId(int userId) {
        return userMapper.getByUserId(userId);
    }

    @Override
    public User getByUserEmail(String userEmail) {
        return userMapper.getByUserEmail(userEmail);
    }

    @Override
    public User getByUserName(String userName) {
        return userMapper.getByUserName(userName);
    }

    @Override
    public User getByPhoneNumber(String phoneNumber) {
        return userMapper.getByPhoneNumber(phoneNumber);
    }
}
