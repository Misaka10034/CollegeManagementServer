package com.schmanagement.shiro;

import cn.hutool.core.bean.BeanUtil;
import com.schmanagement.entity.Account;
import com.schmanagement.entity.Student;
import com.schmanagement.service.AccountService;
import com.schmanagement.service.StudentService;
import com.schmanagement.util.JwtUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StuRealm extends AuthorizingRealm {
    @Autowired
    JwtUtils jwtUtils;

    @Autowired
    StudentService studentService;
    @Override
    public boolean supports(AuthenticationToken token){
        return token instanceof StuToken;
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {//获取账户权限信息
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {//密码校验逻辑实现
        StuToken jwtToken=(StuToken) token;
        String idfromToken = jwtUtils.getClaimByToken((String) jwtToken.getPrincipal()).getSubject();
        Student student =studentService.getById(Long.valueOf(idfromToken));
        if(student==null){
            throw  new UnknownAccountException("用户名输入错误或账户不存在");
        }
        StuProfile profile=new StuProfile();
        BeanUtil.copyProperties(student,profile);
        //  System.out.println("");
        return new SimpleAuthenticationInfo(profile,jwtToken.getCredentials(),getName());
    }
}

