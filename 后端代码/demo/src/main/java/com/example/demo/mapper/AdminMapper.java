package com.example.demo.mapper;

import com.example.demo.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AdminMapper {
    public List<Admin> login(String mamnaerName,String password);
    @Select(" select  * from administrators")
    public List<Admin> all();
}
