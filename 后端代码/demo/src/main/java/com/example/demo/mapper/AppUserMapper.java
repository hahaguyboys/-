package com.example.demo.mapper;
import com.example.demo.dto.AdoRecordsDto;
import com.example.demo.dto.AppUserDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface AppUserMapper {
    @Update("update adoption_applications" +
            "        set Adoption_Status=#{adoptionStatus} where Application_id=#{applicationId}")
    public void changeStatusApp(AppUserDto appUserDto);

    public List<AppUserDto> selectApp();

    public List<AppUserDto> selectDy(String username,String breed,String address,Integer adoptionStatus);

}
