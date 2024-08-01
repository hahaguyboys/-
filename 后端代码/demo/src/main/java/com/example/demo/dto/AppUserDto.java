package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AppUserDto {
    private Integer applicationId;
    private  Date applicationTime;
    private String username;
    private String breed;
    private String contactPhonenumber;
    private  String address;
    private  Integer adoptionStatus;
    private Integer petId;
    private Integer userId;
    private Integer ccomment;
}
