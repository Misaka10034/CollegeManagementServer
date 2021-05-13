package com.schmanagement.controller;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.map.MapUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.schmanagement.common.dto.LoginDto;
import com.schmanagement.common.lang.Result;
import com.schmanagement.entity.Account;
import com.schmanagement.entity.WorkOrder;
import com.schmanagement.service.AccountService;
import com.schmanagement.shiro.JwtFilter;
import com.schmanagement.shiro.JwtToken;
import com.schmanagement.shiro.UserRealm;
import com.schmanagement.util.JwtUtils;
import com.schmanagement.util.ShiroUtil;
import io.jsonwebtoken.Claims;
import org.apache.catalina.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
public class UserController {
    @Autowired
    AccountService accountService;
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    UserRealm userRealm;

    @CrossOrigin
    @PostMapping("/login_server")

    public Result login(@Validated @RequestBody LoginDto loginDto, HttpServletResponse response){
        Account account=accountService.getOne(new QueryWrapper<Account>().eq("ID",loginDto.getId()));//先查用户表
        Assert.notNull(account,"用户不存在");//验证是否为空
        if(!account.getPassword().equals(SecureUtil.md5(loginDto.getPassword()))){
            return Result.fail("密码不正确");
        }
        String jwt=jwtUtils.generateToken(account.getId());
        Subject subject=SecurityUtils.getSubject();
        subject.login(new JwtToken(jwt));
        response.setHeader("Authorization",jwt);
        response.setHeader("Access-control-Expose-Headers","Authorization");
        return Result.succ(MapUtil.builder()
                .put(("id"),account.getId())
                .put("password",account.getPassword())
                .put(("kind"),account.getKind())
                .map()
        );
    }
    @GetMapping("/logout")
    @RequiresAuthentication
    public Result logout(){
//        System.out.println(SecurityUtils.getSubject());
        SecurityUtils.getSubject().logout();
        return Result.succ(null);
    }
    @GetMapping("/getlist")
    public Result getlist(){
//        System.out.println(SecurityUtils.getSubject());
        List<Account> accounts = accountService.list(new QueryWrapper<Account>().eq("Kind", 1));
        accounts.addAll(accountService.list(new QueryWrapper<Account>().eq("Kind", 3)));
        return Result.succ(accounts);
    }
}
