package com.example.demo.controllers;


import com.example.demo.dto.AppUserDto;
import com.example.demo.dto.ComplainsDto;
import com.example.demo.mapper.*;
import com.example.demo.pojo.Pets;
import com.example.demo.pojo.Users;
import com.example.demo.vo.Resulty;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@CrossOrigin
@RestController
@Slf4j
@RequestMapping("/User")
@EnableTransactionManagement
public class UsersControllers {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ComplainsMapper complainsMapper;

    @Autowired
    private AppUserMapper appUserMapper;
    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private NotificationMapper notificationMapper;
    @Autowired
    private PetMapper petMapper;


    //查询所有的用户数据
    @GetMapping("/list")
    public Resulty list (){//获取列表
        List<Users> u1=userMapper.list();
        return Resulty.success(u1);
    }
    //查询函数
    @GetMapping("/detail/{id}")
    public Resulty detail(@PathVariable int id){//查询数据
//        List<Users> usersList=userMapper.selectUserById(id);
       return Resulty.success(null);
    }

    @PostMapping("/add")
    public Resulty add (@RequestBody Users poi){//添加数据

        return Resulty.success();
    }
    @PutMapping("/edit")
    public Resulty edit () {//修改数据

        return Resulty.success(null);

    }
    @DeleteMapping("/delete")
    public Resulty delete (){//删除数据
        return Resulty.success();
    }


    //-----------------------------------------------------------------------------------
    @GetMapping("/selectUser")
    public Resulty selectDyUser(@RequestParam(required = false) String name,
                                @RequestParam(required = false) String gender)
    {
        if ("".equals(name)) {
            name = null;
        }
        if ("".equals(gender)) {
            gender = null;
        }
        log.info("2222222222222{}{}{}{}",name,gender);
        List<Users> l1= userMapper.selectAccordWith(name,gender);
        return Resulty.success(l1);
    }

    @GetMapping("/selectComplains")
    public Resulty selectComplains(){
        List<ComplainsDto> l1= complainsMapper.selectAll();
        return Resulty.success(l1);
    }

    @GetMapping("/selectApp")
    public Resulty selectApp(){
        List<AppUserDto> l1=appUserMapper.selectApp();
        return Resulty.success(l1);
    }

    @Transactional
    @PutMapping("/changeAppStatus")
    public Resulty changeAppStatus(@RequestBody AppUserDto appUserDto){
        int userId=appUserDto.getUserId();
        int petId=appUserDto.getPetId();
        int Ccomment=appUserDto.getCcomment();
        log.info("1111111111111111111-------{}",appUserDto.getPetId());
        log.info("1111111111111111111-------{}",appUserDto.getUserId());
        LocalDate adoptionTime = LocalDate.now();
        Integer status = null;
        List<Pets> petsList = petMapper.selectById(petId);
        for (Pets pet : petsList) {
            status = pet.getAdoptionStatus();
            log.info("--------{}",status);
        }
        appUserMapper.changeStatusApp(appUserDto);
        if(status==0 && Ccomment==1)
        {
            String text1="您的领养申请已通过，感谢您的支持！！";
            commonMapper.addRecords(userId,petId,adoptionTime,1);
            notificationMapper.addNotification(userId,adoptionTime,text1);
            petMapper.changePetStatus(petId,1);
        }
        if(status==1 && Ccomment==1)
        {
            String text2="您的申请宠物已已经被领养，抱歉！！";
            notificationMapper.addNotification(userId,adoptionTime,text2);
        }
        appUserMapper.changeStatusApp(appUserDto);
        if(status==1 && Ccomment==0)
        {
            String text3="您的归还申请已通过，期待下次领养！！";
            commonMapper.addRecords(userId,petId,adoptionTime,0);
            notificationMapper.addNotification(userId,adoptionTime,text3);
            petMapper.changePetStatus(petId,0);
        }
        if(status==3)
        {
            String text3="不好意思，您申请的宠物现在不能被领养";
            notificationMapper.addNotification(userId,adoptionTime,text3);
        }
        return Resulty.success(null);
    }


}
