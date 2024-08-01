package com.example.demo.pojo;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("pet_health_records")
public class PetHealth {
    @TableId
    private Integer recordId;             // 记录id
    private Integer petId;                // 宠物id
    private String vetRecords;        // 兽医记录
    private String vaccinationRecords;// 疫苗接种情况
    private String treatmentRecords;  // 治疗记录
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date lastModifiedTime;    // 上次修改时间
    private Boolean vaccinationStatus;// 疫苗接种状态
}
