package com.schmanagement.util;
import com.schmanagement.shiro.StuProfile;
import com.schmanagement.shiro.UserProfile;
import org.apache.shiro.SecurityUtils;

public class ShiroUtil {

    public static UserProfile getProfile() {
        return (UserProfile) SecurityUtils.getSubject().getPrincipal();
    }
    public static StuProfile getStuProfile() {
        return (StuProfile) SecurityUtils.getSubject().getPrincipal();
    }
}