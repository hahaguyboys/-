package com.example.demo.mapper;
import com.example.demo.pojo.PetHealth;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PetHealthMapper {

    @Select("select * from pet_health_records where pet_id=#{petId}")
    public List<PetHealth> selectall(Integer petId);

    public  void updateHealthDynamic(PetHealth petHealth);

    @Insert("insert into pet_health_records(pet_id, Vet_Records, Vaccination_Records, Treatmen_Records" +
            ", Last_Modified_Time, Vaccination_Status) values (#{petId},#{vetRecords},#{vaccinationRecords}," +
            "#{treatmentRecords},#{lastModifiedTime},#{vaccinationStatus})")
    public  void addHealth(PetHealth petHealth);

}
