package com.example.demo.mapper;

import com.example.demo.dto.AppUserDto;
import com.example.demo.pojo.Complains;
import com.example.demo.pojo.Users;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

@Mapper
public interface UserMapper {

    //查匈所有的用户信息用一个列表装起来
    @Select("select  username, contact_phonenumber, address, gender, last_modified_time from users")
    public List<Users> list();
    //插入新用户
    @Insert("insert into users(username, User_Password, Contact_Phonenumber, Address, Gender, Last_Modified_Time) " +
            "values (#{username},#{userPassword},#{contactPhonenumber},#{address},#{gender},#{lastModifiedTime})")
    public void addUser(Users user);

    //查询指定id的用户
//    @Results({
//            @Result(column = "User_id",property = "userId"),
//            @Result(column = "User_Password",property = "userPassword"),
//            @Result(column = "Contact_Phonenumber",property = "contactPhonenumber"),
//            @Result(column = "Address",property = "address"),
//            @Result(column = "Gender",property = "gender"),
//            @Result(column = "last_Modified_Time",property = "lastModifiedTime"),
//    })


    //查询符合条件的用户信息
//    @Select("select *  from users where username like '%${username}%' and Gender=#{gender} and " +
//            "Last_Modified_Time between #{d1} and #{d2} ")

    //动态查询用户信息
    public List<Users> selectAccordWith(String username , String gender);


}
