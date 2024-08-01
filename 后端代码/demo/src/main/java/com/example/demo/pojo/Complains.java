package com.example.demo.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("Complaints")
public class Complains {
    @TableId
    private int notificationId;

    private Date notificationTime;


    private String notificationContent;


    private int adminId;


    private byte adoptionStatus;

    private Integer userId;
}
