package com.schmanagement.controller;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.schmanagement.common.lang.Result;
import com.schmanagement.entity.PunishReward;
import com.schmanagement.entity.WorkOrder;
import com.schmanagement.service.AccountService;
import com.schmanagement.service.PunishRewardService;
import com.schmanagement.util.ShiroUtil;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 奖惩信息表 前端控制器
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-01
 */
@RestController
public class PunishRewardController {
    @Autowired
    PunishRewardService punishRewardService;
    @Autowired
    AccountService accountService;
    @PostMapping("/submitreward")
    public Result submitreward(@RequestBody PunishReward punishReward){
        if(punishRewardService.saveOrUpdate(punishReward))  return Result.succ("操作成功");
        else return Result.fail("操作错误");
    }
    @PostMapping("/setpunish")
    public Result setpunish(@RequestBody PunishReward punishReward){
        long id= ShiroUtil.getProfile().getId();
        int kind=accountService.getById(id).getKind();
        if(kind==3) {
            if(punishRewardService.saveOrUpdate(punishReward))  return Result.succ("操作成功");
        }
        else return Result.fail("操作权限错误");
        return null;
    }

    @RequiresAuthentication
    @PostMapping("/delete/{prid}")
    public Result delete(@RequestBody @PathVariable(name = "prid") Long targetid){
        long id= ShiroUtil.getProfile().getId();
        int kind=accountService.getById(id).getKind();
        if(kind==1||kind==3) {
            if(punishRewardService.removeById(targetid))  return Result.succ("操作成功");
        }
        else return Result.fail("操作权限错误");
        return null;
    }
    @GetMapping("/getdetailedpr/{id}")
    public Result getdetailedpr(@RequestBody @PathVariable(name = "id") Long id){
        PunishReward punishReward=punishRewardService.getById(id);
        return Result.succ(punishReward);
    }
    @RequiresAuthentication
    @PostMapping("/getpr/{id}")
    public Result stugetpr(@RequestBody @PathVariable(name = "id") Long id, Integer currentPage){
            if(currentPage == null || currentPage < 1) currentPage = 1;
            Page page = new Page(currentPage, 6);
            IPage pageData = punishRewardService.page(page, new QueryWrapper<PunishReward>().orderByAsc("ID").eq("StuID", id));
            return Result.succ(pageData);
    }
    @RequiresAuthentication
    @PostMapping("/teagetpr/{id}")
    public Result teagetpr(@RequestBody @PathVariable(name = "id") Long id, Integer currentPage){
        if(currentPage == null || currentPage < 1) currentPage = 1;
        Page page = new Page(currentPage, 6);
        IPage pageData = punishRewardService.page(page, new QueryWrapper<PunishReward>().orderByAsc("ID").eq("AdminID", id));
        return Result.succ(pageData);
    }
    @RequiresAuthentication
    @PostMapping("/adoptreward/{id}")
    public Result handlereward(@RequestBody @PathVariable(name = "id") Long punishRewardid){
        long id= ShiroUtil.getProfile().getId();
        int kind=accountService.getById(id).getKind();
        if(kind==3) {
            System.out.println(punishRewardid);
            PunishReward punishReward=punishRewardService.getById(punishRewardid);
            punishReward.setFinished(1);
            if(punishRewardService.saveOrUpdate(punishReward))  return Result.succ("操作成功");
        }
        else return Result.fail("操作权限错误");
        return null;
    }
    @RequiresAuthentication
    @PostMapping("/refusereward/{id}")
    public Result refusereward(@RequestBody @PathVariable(name = "id") Long punishRewardid){
        long id= ShiroUtil.getProfile().getId();
        int kind=accountService.getById(id).getKind();
        if(kind==3) {
            PunishReward punishReward=punishRewardService.getById(punishRewardid);
            punishReward.setFinished(2);
            if(punishRewardService.saveOrUpdate(punishReward))  return Result.succ("操作成功");
        }
        else return Result.fail("操作权限错误");
        return null;
    }
}
