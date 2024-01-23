package com.group3.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import com.group3.enums.UserIdentity;
import com.group3.mapper.UserMapper;
import com.group3.pojo.User;
import com.group3.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;
    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 注册业务实现
     * 用户输入用户名，密码
     *
     * @param userName
     * @param userPwd
     * @return
     */
    @Override
    public int register(String userName, String userPwd) {
        if(userMapper.getByUserName(userName) == null){
            User user = new User();
            user.setUserName(userName);
            user.setUserPwd(DigestUtils.md5Hex(userPwd));
            user.setRegistrationTime(LocalDateTimeUtil.now());//注册时间
            user.setUserIdentity(UserIdentity.CUSTOMER);//默认用户身份为顾客
            return userMapper.add(user);
        }else{
            return -1;
        }
    }

    @Override
    public boolean pwdLogin(String userName, String userPwd) {
        boolean flag = false;
        User user = userMapper.getByUserName(userName);
        String mdPwd = DigestUtils.md5Hex(userPwd);
//        System.out.println(mdPwd);
//        System.out.println(user.getUserPwd());
        if(user != null && user.getUserPwd().equals(mdPwd)){
            flag=true;//用户存在且密码一致
        }
        return flag;
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
