package com.group3.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private LocalDateTime registrationTime;
    private UserIdentity userIdentity;
}
