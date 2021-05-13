package com.schmanagement.shiro;

import org.apache.shiro.authc.AuthenticationToken;

public class StuToken implements AuthenticationToken {
    private String token;
    public StuToken(String jwt){
        this.token=jwt;
    }
    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
