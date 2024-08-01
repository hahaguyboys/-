package com.example.demo.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NotificationsDto {
    @TableId
    private Integer systemNotificationId;
    private Integer userId;
    private String username;
    private LocalDate notificationTIme ;
    private String notificationContent;
}
