package com.example.demo.controllers;


import com.example.demo.mapper.PetHealthMapper;
import com.example.demo.mapper.PetMapper;
import com.example.demo.pojo.PetHealth;
import com.example.demo.pojo.Pets;
import com.example.demo.vo.Resulty;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@Slf4j

@RequestMapping("/Pet")
public class PetControllers {

    @Autowired
    private PetMapper petMapper;

    @Autowired
    private PetHealthMapper petHealthMapper;

    @GetMapping("/listHealth/{petId}")
    public Resulty addHealth(@PathVariable Integer petId){
        List<PetHealth> p1=petHealthMapper.selectall(petId);
         return Resulty.success(p1);
    }

    @PutMapping("/updateHealth")
    public  Resulty updateHealth(@RequestBody PetHealth petHealth){
        log.info("111{}",petHealth);
        petHealthMapper.updateHealthDynamic(petHealth);
        return Resulty.success(null);
    }

    @GetMapping("/list")
    public Resulty all(){
        List<Pets> p1=petMapper.all();
        return Resulty.success(p1);
    }

    @PutMapping("/updatePet")
    public Resulty updatePet(@RequestBody Pets pet) {
        log.info("111111{}",pet);
        petMapper.updateDynamic(pet);
        return Resulty.success(null);
    }


    //-----------------------------------------------------------------------
    @GetMapping("/selsectPet")
    public Resulty selectDynamic1(@RequestParam(required = false) String category,
                                  @RequestParam(required = false) String breed,
                                  @RequestParam(required = false) String gender,
                                  @RequestParam(required = false) Boolean neutered,
                                  @RequestParam(required = false) Boolean adoptionHistory) {
        // 将空字符串转换为 null
        if ("".equals(category)) {
            category = null;
        }
        if ("".equals(breed)) {
            breed = null;
        }
        if ("".equals(gender)) {
            gender = null;
        }
        // Boolean 类型参数在未传递时为 null，无需处理
        log.info("1111{}{}",neutered,adoptionHistory);
        List<Pets> p1 = petMapper.selectPet(category, breed, gender, neutered, adoptionHistory);
        return Resulty.success(p1);
    }

    //添加宠物
    @PutMapping("/addPet")
    public Resulty addPet(@RequestBody Pets pets){
        log.info("111111111{}",pets);
        petMapper.addPet(pets);
        return Resulty.success(null);
    }

    @PutMapping("/addHealth")
    public Resulty addHealth(@RequestBody PetHealth petHealth){
        log.info("2222222{}",petHealth);
        petHealthMapper.addHealth(petHealth);
        return Resulty.success(null);
    }

    @GetMapping("/selectById/{petId}")
    public Resulty selectById(@PathVariable Integer petId){
        List<Pets> p1=petMapper.selectById(petId);
        return Resulty.success(p1);
    }

}
