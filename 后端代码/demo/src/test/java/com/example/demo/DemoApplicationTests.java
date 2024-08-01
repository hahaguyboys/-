package com.example.demo;

import com.example.demo.controllers.CommonControllers;
import com.example.demo.dto.AppUserDto;
import com.example.demo.dto.ComplainsDto;
import com.example.demo.dto.NotificationsDto;
import com.example.demo.mapper.*;
import com.example.demo.pojo.Admin;
import com.example.demo.pojo.Pets;
import com.example.demo.pojo.Users;
import com.example.demo.vo.Resulty;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class DemoApplicationTests {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private PetMapper petMapper;
	@Autowired
	private AppUserMapper appUserMapper;

	@Autowired
	private PetHealthMapper petHealthMapper;

	@Autowired
	private ComplainsMapper complainsMapper;

	@Autowired

	private AdminMapper adminMapper;

	@Autowired
	private NotificationMapper notificationMapper;
	@Test
	public void testListUser() {
		List<Users> usersList=userMapper.list();
		usersList.stream().forEach(users -> {
			System.out.println(users);
		});

	}
	@Test
	public void testAdd() {//测试
		List<NotificationsDto> l1=notificationMapper.listNo();
		System.out.println(l1);
	}
	@Test
	public void test() {
//		List<Pets> L2 =petMapper.all();
//	petMapper.addPet("熊","黑熊",12,"公",52.1f,"黑白","四川","aaaa",false
//			,true,1);
//		appUserMapper.changeStatusApp(1,1);
		List<Admin> l1=adminMapper.all();
		System.out.println(l1);
	}
	@Test
	public void test1() {
		List<Pets> p1= petMapper.selectPet("狗",null,null,null,true);
		System.out.println(p1);
	}
}
