package com.group3.mapper;

import com.group3.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    //添加一个用户
    public int add(User user);
    //删除一个用户
    public int delete(@Param("userId") int userId);
    //更新用户信息
    public int update(User user);
    //根据用户Id查询
    public User getByUserId(@Param("userId") int userId);
    //根据用户邮箱查询
    public User getByUserEmail(@Param("userEmail") String userEmail);
    //根据用户名查询
    public User getByUserName(@Param("userName") String userName);
    //根据用户名查询
    public User getByPhoneNumber(@Param("phoneNumber") String phoneNumber);
}
