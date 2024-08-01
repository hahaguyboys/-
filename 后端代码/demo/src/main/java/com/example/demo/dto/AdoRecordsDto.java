package com.example.demo.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdoRecordsDto {
    @TableId
    private Integer adoptionRecordsId;
     private  Integer userId;
     private  String username;
     private Integer petId;
     private  String breed;
     private LocalDate adoptionTime;
     private  Integer adoptionStatus;
}
