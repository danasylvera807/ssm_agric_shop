package com.group3.pojo;

import com.group3.enums.UserIdentity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private int userId;
    private String userName;
    private String userPwd;
    private String userEmail;
    private String phoneNumber;
    private String userAddress;
    private LocalDateTime registrationTime;
    private UserIdentity userIdentity;
}
