package com.example.demo.controllers;


import com.example.demo.dto.*;
import com.example.demo.mapper.*;
import com.example.demo.pojo.Complains;
import com.example.demo.pojo.Tag;
import com.example.demo.service.TagService;
import com.example.demo.vo.Resulty;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@CrossOrigin
@RestController
@Slf4j
@EnableTransactionManagement
@RequestMapping("/Common")
public class CommonControllers {
    @Autowired
    private CommonMapper commonMapper;

    @Autowired
    private AppUserMapper appUserMapper;
    @Autowired
    private ComplainsMapper complainsMapper;
    @Autowired
    private NotificationMapper notificationMapper;
    @Autowired
    private PetTagMapper petTagMapper;
    @Autowired
    private TagMapper tagMapper;
    @Autowired
    private TagService tagService;

    @GetMapping("/selectRecords")
    public Resulty selectRecords(){
        List<AdoRecordsDto> l1=commonMapper.selectRecords();
        return Resulty.success(l1);
    }

    @GetMapping("/selectDyApp")
    public Resulty selectDyApp(@RequestParam(required = false) String username,
                               @RequestParam(required = false) String breed,
                               @RequestParam(required = false) String address,
                               @RequestParam(required = false) Integer adoptionStatus){

        if ("".equals(username)) {
            username = null;
        }
        if ("".equals(breed)) {
            breed = null;
        }
        if ("".equals(address)) {
            address = null;
        }
        List<AppUserDto> l1=appUserMapper.selectDy(username,breed,address,adoptionStatus);
        return Resulty.success(l1);
    }

    @GetMapping("/selectDyComplains")
    public Resulty selectDyComplains(@RequestParam(required = false) String username,
                                     @RequestParam(required = false) Integer adoptionStatus){
        if ("".equals(username)) {
            username = null;
        }
        if(adoptionStatus==3){
            adoptionStatus=null;
        }

        List<ComplainsDto> l1=complainsMapper.selectDy(username,adoptionStatus);
        return Resulty.success(l1);
    }

    @GetMapping("/seeText/{notificationId}")
    public Resulty seeText(@PathVariable Integer notificationId){
        List<ComplainsDto> l1=complainsMapper.seeText(notificationId);
        return Resulty.success(l1);
    }
    @Transactional 
    @PutMapping("/changeComStatus")
    public Resulty changeComStatus(@RequestBody Complains complains){
        log.info("-----------------{}",complains.getUserId());
        log.info("-----------------{}",complains.getAdoptionStatus());
        int userId=complains.getUserId();
        int status=complains.getAdoptionStatus();
        LocalDate notificationTIme = LocalDate.now();
        String text="您的投诉我们已经处理，感谢您的建议！";
        if(status==1)
        {
            notificationMapper.addNotification(userId,notificationTIme,text);
        }
        complainsMapper.changeStatus(complains);

        return Resulty.success(null);
    }

    @GetMapping("/listNotification")
    public Resulty listNotification(){
        List<NotificationsDto> l1=notificationMapper.listNo();
        return Resulty.success(l1);
    }

    @Transactional
    @GetMapping("/selectDyNo")
    public Resulty selectDyNo(@RequestParam(required = false) String username,
                              @RequestParam(required = false) String d1,
                              @RequestParam(required = false) String d2) {
        log.info("{}{}{}", username, d1, d2);
        LocalDate begin=null;
        LocalDate end=null;
        if ("".equals(username)) {
            username = null;
        }
        if ("".equals(d1) && "".equals(d2)) {
            d1 = null;
            d2 = null;
        }
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try {
            if(d1!=null&&d2!=null) {
                 begin = LocalDate.parse(d1, dateFormatter);
                 end = LocalDate.parse(d2, dateFormatter);
                log.info("Parsed Dates: begin={}, end={}", begin, end);
            }
            List<NotificationsDto> notifications = notificationMapper.selectDyNo(username, begin, end);
            return Resulty.success(notifications);
        } catch (Exception e) {
            log.error("Error parsing date: {}", e.getMessage(), e);
            return Resulty.failed();
        }
    }

    @GetMapping("/selectDyRecords")
    public Resulty selectDyRecords(@RequestParam(required = false) String username,
                                   @RequestParam(required = false) String breed){

        if ("".equals(username)) {
            username = null;
        }
        if ("".equals(breed)) {
            breed = null;
        }
        List<AdoRecordsDto> l1=commonMapper.selectDYRecords(username,breed);
        return  Resulty.success(l1);
    }

    @GetMapping("/selecTag/{petId}")
    public Resulty selecTag(@PathVariable Integer petId){
        List<String> l1=petTagMapper.selectTag(petId);
        log.info("--------->{}",l1);
        return Resulty.success(l1);
    }
    @GetMapping("/tagAll")
    public Resulty selecttagall(){
        List<Tag> l1=tagMapper.tagAll();
        return Resulty.success(l1);
    }
    @PutMapping("/addTag/{tagName}")
    public Resulty addTag(@PathVariable String tagName) {
        try {
            tagMapper.addTag(tagName);
            return Resulty.success(null); // 标签添加成功返回成功结果
        } catch (DataIntegrityViolationException ex) {
            // 捕获数据完整性违规异常
            if (ex.getCause() instanceof org.apache.ibatis.exceptions.PersistenceException cause) {
                if (cause.getCause() instanceof java.sql.SQLIntegrityConstraintViolationException sqlEx) {
                    if ("45000".equals(sqlEx.getSQLState())) {
                        // 标签名称已存在，返回失败结果
                        return Resulty.success("标签名称已存在");
                    }
                }
            }
            // 其他异常情况，返回失败结果
            return Resulty.success("数据库错误");
        }
    }
    @GetMapping("/popular")
    public Resulty popular(){
        List<Popular> l1=commonMapper.popular();
        return Resulty.success(l1);
    }

    @GetMapping("/region")
    public  Resulty region(){
        List<Region> l1=commonMapper.region();
        return Resulty.success(l1);
    }
    @DeleteMapping("/deleteTag/{tagId}")
    public Resulty deleteTag(@PathVariable int tagId) {
        if (petTagMapper.selectTag(tagId)==null){
                log.info("----->{}",petTagMapper.selectTag(tagId));
                petTagMapper.selectTag(tagId);
                return Resulty.success(null);
        }
        else {
            tagService.deleteTagAndRelatedRecords(tagId);
            return Resulty.success(null);
        }
    }

}
