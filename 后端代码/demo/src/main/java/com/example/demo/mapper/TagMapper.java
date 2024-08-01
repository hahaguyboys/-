package com.example.demo.mapper;

import com.example.demo.pojo.Tag;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TagMapper {
    @Select("select * from tags")
    public List<Tag> tagAll();

    @Insert(" insert into tags(Tag_Name) values (#{tagName})")
    public void addTag(String tagName);
    @Delete("delete from tags where Tag_id=#{tagId}")
    public void deletTag(Integer tagId);
}
