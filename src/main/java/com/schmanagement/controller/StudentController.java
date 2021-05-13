package com.schmanagement.controller;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.schmanagement.common.dto.Studto;
import com.schmanagement.common.lang.Result;
import com.schmanagement.entity.Student;
import com.schmanagement.service.AccountService;
import com.schmanagement.service.AdminService;
import com.schmanagement.service.StudentService;
import com.schmanagement.shiro.StuRealm;
import com.schmanagement.util.JwtUtils;
import com.schmanagement.util.ShiroUtil;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletResponse;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/**
 * <p>
 * 学生表 前端控制器
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-05
 */
@RestController

public class StudentController {
    @Autowired
    StudentService studentService;
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    StuRealm stuRealm;
    @Autowired
    AccountService accountService;
    @CrossOrigin

    @PostMapping("/student")
    public Result getDetailedInfo(@Validated @RequestBody Studto studto, HttpServletResponse response){
        Student student=studentService.getOne(new QueryWrapper<Student>().eq("ID",studto.getId()));
        String jwt=jwtUtils.generateToken(student.getId());
        response.setHeader("Authorization",jwt);
        response.setHeader("Access-control-Expose-Headers","Authorization");
        return Result.succ(MapUtil.builder()
                .put(("id"),student.getId())
                .put(("password"),student.getPassword())
                .put(("name"),student.getName())
                .put(("birth"),student.getBirth())
                .put(("sex"),student.getSex())
                .put(("phoneNumber"),student.getPhoneNumber())
                .put(("address"),student.getAddress())
                .put(("grade"),student.getGrade())
                .put(("major"),student.getMajor())
                .put(("position"),student.getPosition())
                .put(("admissionTime"),student.getAdmissionTime())
                .put(("graduationTime"),student.getGraduationTime())
                .put(("head"),student.getHead())
                .put(("siid"),student.getSiid())
                .put(("registered"),student.getRegistered())
                .map()
        );
    }
//    用户更新
    @RequiresAuthentication
    @PostMapping("/student/stuedit")
    public Result edit(@Validated @RequestBody Student student) {
        boolean result=studentService.updateById(student);
        if(result){
            return Result.succ("用户数据更新成功");
        }
        else return Result.fail("更新失败");
    }
    @GetMapping("/student/reset")
    public Result reset(Long id) {
        Student student=studentService.getById(id);
        System.out.println(id);
        System.out.println(student);
        student.setRegistered(false);
        boolean result=studentService.updateById(student);
        if(result){
            return Result.succ("用户数据更新成功");
        }
        else return Result.fail("更新失败");
    }//重置账户
    @RequiresAuthentication
    @PostMapping("/addstu/{num}")
    public Result addStu(@Validated @RequestBody @PathVariable(name = "num") int num) {
        long id=ShiroUtil.getProfile().getId();
        int kind=accountService.getById(id).getKind();
        boolean result=false;
        if (kind==1){
            int i=0;
            for(i=0;i<num;i++){
                Student student=new Student();
                student.setRegistered(false);
                result=studentService.save(student);
            }
        }
        else{
            System.out.println("账户权限不足");
            return Result.fail("操作失败");
        }
        if (result) return Result.succ("操作成功");
        else return Result.fail("操作失败");

    }
}
