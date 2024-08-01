package com.example.demo.controllers;

import com.example.demo.mapper.AdminMapper;
import com.example.demo.pojo.Admin;
import com.example.demo.vo.Resulty;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.*;

import java.security.MessageDigest;
import java.util.List;

@CrossOrigin
@RestController
@Slf4j
@EnableTransactionManagement
@RequestMapping("/Admin")
public class AdminControllers {
    @Autowired
    private AdminMapper adminMapper;

    @GetMapping("/login/{name}/{pass}")
    public Resulty login(@PathVariable String name,@PathVariable String pass){
        String hashedPassword = getSHA256Hash(pass, "your_salt");
        log.info("------------{}",hashedPassword);
        List<Admin> l1=adminMapper.login(name,hashedPassword);
        return Resulty.success(l1);
    }

    private String getSHA256Hash(String password, String salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update((password + salt).getBytes());
            byte[] byteData = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : byteData) {
                sb.append(String.format("%02x", b));
            }
            log.info("2222222222222222--{}",sb);
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
