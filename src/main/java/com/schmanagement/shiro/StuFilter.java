package com.schmanagement.shiro;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.apache.shiro.authc.AuthenticationToken;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class StuFilter extends JwtFilter{
    @Override
    protected AuthenticationToken createToken(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        HttpServletRequest request=(HttpServletRequest) servletRequest;
        String jwt=request.getHeader("Authorization");
        if(StringUtils.isEmpty(jwt)) return null;
        return new StuToken(jwt);
    }
}
