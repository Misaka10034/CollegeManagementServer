package com.schmanagement.controller;


import cn.hutool.core.map.MapUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.schmanagement.common.dto.LoginDto;
import com.schmanagement.common.dto.Studto;
import com.schmanagement.common.lang.Result;
import com.schmanagement.entity.Admin;
import com.schmanagement.entity.Student;
import com.schmanagement.service.AdminService;
import com.schmanagement.service.StudentService;
import com.schmanagement.shiro.StuRealm;
import com.schmanagement.util.JwtUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-05
 */
@RestController
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    JwtUtils jwtUtils;

    @CrossOrigin
    @PostMapping("/admin")
    public Result getDetailedInfo(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response){
        Admin admin=adminService.getOne(new QueryWrapper<Admin>().eq("ID",loginDto.getId()));
        String jwt=jwtUtils.generateToken(admin.getId());
        response.setHeader("Authorization",jwt);
        response.setHeader("Access-control-Expose-Headers","Authorization");
        return Result.succ(MapUtil.builder()
                .put(("id"),admin.getId())
                .put(("password"),admin.getPassword())
                .put(("name"),admin.getName())
                .put(("head"),admin.getHead())
                .map()
        );
    }
    @RequiresAuthentication
    @PostMapping("/admin/adminedit")
    public Result edit(@Validated @RequestBody Admin admin) {
        boolean result=adminService.updateById(admin);
        if(result){
            return Result.succ("用户数据更新成功");
        }
        else return Result.fail("更新失败");
    }
    @GetMapping("/admin/reset")
    public Result reset(Long id) {
        Admin admin=adminService.getById(id);
        admin.setPassword("admin");
        boolean result=adminService.updateById(admin);
        if(result){
            return Result.succ("用户数据重置");
        }
        else return Result.fail("更新失败");
    }
}
