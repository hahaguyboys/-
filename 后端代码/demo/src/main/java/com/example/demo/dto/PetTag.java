package com.example.demo.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("pet_tag_management")
public class PetTag {
    @TableId
    private   Integer tagId;
    private   Integer petId;
    private  String tagName;
}
