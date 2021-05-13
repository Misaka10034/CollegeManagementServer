package com.schmanagement.shiro;

import cn.hutool.core.bean.BeanUtil;
import com.schmanagement.entity.Account;
import com.schmanagement.service.AccountService;
import com.schmanagement.util.JwtUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserRealm extends AuthorizingRealm {

    @Autowired
    JwtUtils jwtUtils;

    @Autowired
    AccountService accountService;

    @Override
    public boolean supports(AuthenticationToken token){
        return token instanceof JwtToken;
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {//获取账户权限信息
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {//密码校验逻辑实现
        JwtToken jwtToken=(JwtToken) token;
        String idfromToken = jwtUtils.getClaimByToken((String) jwtToken.getPrincipal()).getSubject();
        Account account =accountService.getById(Long.valueOf(idfromToken));
        if(account==null){
            throw  new UnknownAccountException("用户名输入错误或账户不存在");
        }
        UserProfile profile=new UserProfile();
        BeanUtil.copyProperties(account,profile);
      //  System.out.println("");
        return new SimpleAuthenticationInfo(profile,jwtToken.getCredentials(),getName());
    }
}
