package com.example.demo.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("pets")
public class Pets {
    @TableId
    private Integer petId;
    private String category;
    private String breed;
    private Integer age;
    private String gender;
    private Float weight;
    private String color;
    private String region;
    private String petName;
    private Boolean neutered;
    private Boolean adoptionHistory;
    private Integer adoptionStatus;
}
