package com.example.demo.mapper;
import com.example.demo.pojo.Pets;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper

public interface PetMapper {


    //动态sql
    public List<Pets> selectPet(String category, String breed, String gender,
                                Boolean neutered, Boolean adoptionHistory);


    //查询全部信息
    @Select("select * from pets")
    public List<Pets> all();


    public void updateDynamic(Pets pets);

    //添加宠物
    public void addPet(Pets pets);

    //正在领养的宠物以及领养人
    @Select("select * from pets where Pet_id=#{petId}")
    public List<Pets> selectById(Integer petId);

    public void changePetStatus(Integer petId,Integer adoptionStatus);
    
}


//        String category, String breed,Integer age, String gender,Float weight,String color,
//        String region,String petName,
//        Boolean neutered,Boolean adoptionHistory,Integer adoptionStatus