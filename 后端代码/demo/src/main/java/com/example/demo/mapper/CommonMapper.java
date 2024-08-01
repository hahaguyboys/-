package com.example.demo.mapper;

import com.example.demo.dto.AdoRecordsDto;
import com.example.demo.dto.NotificationsDto;
import com.example.demo.dto.Popular;
import com.example.demo.dto.Region;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface CommonMapper {
    public List<AdoRecordsDto> selectRecords();

    public List<AdoRecordsDto> selectDYRecords(String username, String breed);

    public void addRecords(Integer userId, Integer petId, LocalDate adoptionTime,Integer adoptionStatus);

    public List<Popular> popular();

    public List<Region> region();

}
