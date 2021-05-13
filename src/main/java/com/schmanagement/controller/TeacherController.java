package com.schmanagement.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.schmanagement.common.dto.LoginDto;
import com.schmanagement.common.dto.Studto;
import com.schmanagement.common.lang.Result;
import com.schmanagement.entity.Student;
import com.schmanagement.entity.Teacher;
import com.schmanagement.service.AccountService;
import com.schmanagement.service.StudentService;
import com.schmanagement.service.TeacherService;
import com.schmanagement.shiro.StuRealm;
import com.schmanagement.util.JwtUtils;
import com.schmanagement.util.ShiroUtil;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * 教师表 前端控制器
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-05
 */
@RestController
public class TeacherController {
    @Autowired
    TeacherService teacherService;
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    AccountService accountService;
    @CrossOrigin

    @PostMapping("/teacher")
    public Result getDetailedInfo(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response){
        Teacher teacher=teacherService.getOne(new QueryWrapper<Teacher>().eq("ID",loginDto.getId()));
        String jwt=jwtUtils.generateToken(teacher.getId());
        response.setHeader("Authorization",jwt);
        response.setHeader("Access-control-Expose-Headers","Authorization");
        return Result.succ(MapUtil.builder()
                .put(("id"),teacher.getId())
                .put(("password"),teacher.getPassword())
                .put(("name"),teacher.getName())
                .put(("sex"),teacher.getSex())
                .put(("position"),teacher.getPosition())
                .put(("head"),teacher.getHead())
                .put(("registered"),teacher.getRegistered())
                .put(("email"),teacher.getEmail())
                .put(("college"),teacher.getCollege())
                .put(("phonenum"),teacher.getPhoneNum())
                .map()
        );
    }
    //    用户更新
    @RequiresAuthentication
    @PostMapping("/teacher/teaedit")
    public Result edit(@Validated @RequestBody Teacher teacher) {
        boolean result=teacherService.updateById(teacher);
        if(result){
            return Result.succ("用户数据更新成功");
        }
        else return Result.fail("更新失败");
    }
    @RequiresAuthentication
    @PostMapping("/addtea/{num}")
    public Result addTea(@Validated @RequestBody @PathVariable(name = "num") int num) {
        long id= ShiroUtil.getProfile().getId();
        int kind=accountService.getById(id).getKind();
        boolean result=false;
        if (kind==1){
            int i=0;
            for(i=0;i<num;i++){
                Teacher teacher=new Teacher();
                teacher.setRegistered(false);
                result=teacherService.save(teacher);
            }
        }
        else{
            System.out.println("账户权限不足");
            return Result.fail("操作失败");
        }
        if (result) return Result.succ("操作成功");
        else return Result.fail("操作失败");

    }
    @GetMapping("/teacher/reset")
    public Result reset(Long id) {
        Teacher teacher=teacherService.getById(id);
        teacher.setRegistered(false);
        boolean result=teacherService.updateById(teacher);
        if(result){
            return Result.succ("用户数据更新成功");
        }
        else return Result.fail("更新失败");
    }//重置
}
