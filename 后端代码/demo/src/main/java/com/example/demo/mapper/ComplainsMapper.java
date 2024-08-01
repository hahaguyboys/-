package com.example.demo.mapper;

import com.example.demo.dto.ComplainsDto;
import com.example.demo.pojo.Complains;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;


@Mapper
public interface ComplainsMapper {

    public List<ComplainsDto> selectAll();

    public List<ComplainsDto> selectDy(String username, Integer adoptionStatus);
    public List<ComplainsDto> seeText(Integer notificationId);

    @Update("update complaints c set c.Adoption_Status=#{adoptionStatus} where c.Notification_id=#{notificationId}")
    public void changeStatus(Complains complains);
}
