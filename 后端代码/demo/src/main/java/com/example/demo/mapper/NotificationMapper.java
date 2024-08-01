package com.example.demo.mapper;

import com.example.demo.dto.NotificationsDto;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Mapper
public interface NotificationMapper {
    public List<NotificationsDto> listNo();

    public List<NotificationsDto> selectDyNo(String username, LocalDate d1 , LocalDate d2);

    public void addNotification(Integer userId,LocalDate notificationTIme,String text);

}
