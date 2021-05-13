package com.schmanagement.controller;


import cn.hutool.core.bean.BeanUtil;
import com.schmanagement.service.AccountService;
import com.schmanagement.service.AdminService;
import com.schmanagement.service.TeacherService;
import com.schmanagement.util.ShiroUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.schmanagement.common.lang.Result;
import com.schmanagement.entity.Announcement;
import com.schmanagement.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-23
 */
@RestController
public class AnnouncementController {
    @Autowired
    AnnouncementService announcementService;
    @Autowired
    AccountService accountService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    AdminService adminService;
    @GetMapping("/announcement")
    public Result blogs(Integer currentPage) {
        if(currentPage == null || currentPage < 1) currentPage = 1;
        Page page = new Page(currentPage, 5);
        IPage pageData = announcementService.page(page, new QueryWrapper<Announcement>().orderByDesc("time"));
        return Result.succ(pageData);
    }
    @GetMapping("/announcementdetailed/{id}")
    public Result detail(@PathVariable(name = "id") Long id) {
        Announcement announcement = announcementService.getById(id);
        Assert.notNull(announcement, "该公告已删除！");
        return Result.succ(announcement);
    }
    @RequiresAuthentication
    @PostMapping("/announcement/edit")
    public Result edit(@Validated @RequestBody Announcement announcement) {
        Announcement temp = new Announcement();
            temp.setTime(LocalDateTime.now());
            temp.setText(announcement.getText());
            long id=ShiroUtil.getProfile().getId();
            int kind=accountService.getById(id).getKind();
            String author;
            if (kind==1){
                author=adminService.getById(id).getName();
                System.out.println(author);
            }else if(kind==3) author=teacherService.getById(id).getName();//作者

            else{
            System.out.println("账户权限不足");
            return Result.fail("操作失败");
        }
            temp.setAuthor(author);
            temp.setAuthorId(id);
        System.out.println(temp);
        BeanUtil.copyProperties(announcement, temp, "id","Author","Time");
        System.out.println(temp);
        announcementService.saveOrUpdate(temp);
        return Result.succ("操作成功");
    }

}
