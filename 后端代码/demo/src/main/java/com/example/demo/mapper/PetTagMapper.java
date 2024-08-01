package com.example.demo.mapper;

import com.example.demo.dto.PetTag;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PetTagMapper {

    public List<String> selectTag(Integer petId);


}
