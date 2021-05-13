package com.schmanagement.controller;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.schmanagement.common.dto.LoginDto;
import com.schmanagement.common.lang.Result;
import com.schmanagement.entity.Account;
import com.schmanagement.entity.Announcement;
import com.schmanagement.entity.Student;
import com.schmanagement.entity.WorkOrder;
import com.schmanagement.service.AccountService;
import com.schmanagement.service.AdminService;
import com.schmanagement.service.TeacherService;
import com.schmanagement.service.WorkOrderService;
import com.schmanagement.shiro.StuRealm;
import com.schmanagement.util.JwtUtils;
import com.schmanagement.util.ShiroUtil;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * <p>
 * 工单 前端控制器
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-03-06
 */
@RestController
public class WorkOrderController {
    @Autowired
    WorkOrderService workOrderService;
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    StuRealm stuRealm;
    @Autowired
    AccountService accountService;
    @Autowired
    AdminService adminService;
    @Autowired
    TeacherService teacherService;
    @CrossOrigin
    @RequiresAuthentication
    @PostMapping("/admgetorder/{targetid}")
    public Result admgetorder(@PathVariable(name = "targetid") Long id,Integer currentPage){
        if(Objects.equals(id, ShiroUtil.getProfile().getId()))
//            WorkOrder workOrder=new WorkOrder();
        {
            if(currentPage == null || currentPage < 1) currentPage = 1;
            Page page = new Page(currentPage, 10);
            IPage pageData = workOrderService.page(page, new QueryWrapper<WorkOrder>().orderByAsc("ID").eq("TargetID", id));
            return Result.succ(pageData);
        }
        else return Result.fail("用户权限不足");
    }
    @RequiresAuthentication
    @PostMapping("/stugetorder/{originid}")
    public Result stugetorder(@RequestBody @PathVariable(name = "originid") Long id,Integer currentPage){
        if(Objects.equals(id, ShiroUtil.getProfile().getId()))
        {
            if(currentPage == null || currentPage < 1) currentPage = 1;
            Page page = new Page(currentPage, 10);
            IPage pageData = workOrderService.page(page, new QueryWrapper<WorkOrder>().orderByAsc("ID").eq("OriginID", id));
            return Result.succ(pageData);
        }
        else return Result.fail("用户权限不足");
    }
    @GetMapping("/getorder/{id}")
    public Result getorder(@RequestBody @PathVariable(name = "id") Long id){
        WorkOrder workOrder=new WorkOrder();
        workOrder=workOrderService.getById(id);
            return Result.succ(workOrder);
    }
    @PostMapping("/handleorder")
    public Result handleorder(@RequestBody @Validated WorkOrder workOrder){
        if(workOrder.getFinished()==1) {
            return Result.fail("当前工单已经处理完成");
        }
        WorkOrder temp=new WorkOrder();
        BeanUtil.copyProperties(workOrder,temp,"Message");
        temp.setMessage(workOrderService.getById(workOrder.getId()).getMessage()+
                workOrder.getTargetID().toString()+":"+
                workOrder.getMessage()+"\n"+
                "------------------------------------------------------------------------------------------------"+"\n");
        temp.setFinished(2);
        if(workOrderService.saveOrUpdate(temp)) return Result.succ("操作成功");
        else return Result.fail("操作失败");
    }
    @PostMapping("/stuhandleorder")
    public Result stuhandleorder(@RequestBody @Validated WorkOrder workOrder){
        if(workOrder.getFinished()==1) {
            return Result.fail("当前工单已经处理完成");
        }
        WorkOrder temp=new WorkOrder();
        System.out.println(workOrder);
        BeanUtil.copyProperties(workOrder,temp,"Message");
        System.out.println(temp);
        temp.setMessage(workOrderService.getById(workOrder.getId()).getMessage()+
                workOrder.getOriginID().toString()+":"+
                workOrder.getMessage()+"\n"+
                "------------------------------------------------------------------------------------------------"+"\n");
        if(workOrderService.saveOrUpdate(temp)) return Result.succ("操作成功");
        else return Result.fail("操作失败");
    }
    @PostMapping("/postorder")
    public Result postorder(@RequestBody @Validated WorkOrder workOrder){
        WorkOrder temp=new WorkOrder();
        BeanUtil.copyProperties(workOrder,temp,"message","id","finished");
        temp.setFinished(0);
        temp.setMessage(workOrder.getOriginID().toString()+":"+
                workOrder.getMessage()+"\n"+"------------------------------------------------------------------------------------------------"+"\n");
        if(workOrderService.saveOrUpdate(temp)) return Result.succ("操作成功");
        else return Result.fail("操作失败");
    }
    @PostMapping("/finishorder/{id}")
    public Result finishorder(@PathVariable(name = "id") Long id){
        if(workOrderService.getById(id).getFinished()==1) {
            return Result.fail("当前工单已经处理完成");
        }
        else {
            WorkOrder temp=workOrderService.getById(id);
            temp.setFinished(1);
            if(workOrderService.saveOrUpdate(temp)) return Result.succ("操作成功");
            else return Result.fail("操作失败");
        }


    }
}
