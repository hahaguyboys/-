package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ComplainsDto {
    private int notificationId;

    private Date notificationTime;

    private String notificationContent;

    private int adminId;

    private Integer adoptionStatus;

    private String username;

    private Integer userId;

}
