package com.group3.service;

import com.group3.pojo.User;

public interface UserService {
    //注册业务实现
    int register(String userName, String userPwd);

    //密码登录
    public boolean pwdLogin(String userName,String userPwd);
    //删除一个用户
    public int delete(int userId);
    //更新用户信息
    public int update(User user);
    //根据用户Id查询
    public User getByUserId(int userId);
    //根据用户邮箱查询
    public User getByUserEmail(String userEmail);
    //根据用户名查询
    public User getByUserName(String userName);
    public User getByPhoneNumber(String phoneNumber);
}
