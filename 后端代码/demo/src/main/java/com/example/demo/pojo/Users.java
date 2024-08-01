package com.example.demo.pojo;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("users")
//用户表
public class Users {
    @TableId
    private Integer userId;
    private String username;
    private String userPassword;
    private String contactPhonenumber;
    private String address;
    private String gender;
    private Date lastModifiedTime;
}
