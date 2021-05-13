package com.schmanagement.service.impl;

import com.schmanagement.entity.WorkOrder;
import com.schmanagement.mapper.WorkOrderMapper;
import com.schmanagement.service.WorkOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 工单 服务实现类
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-03-08
 */
@Service
public class WorkOrderServiceImpl extends ServiceImpl<WorkOrderMapper, WorkOrder> implements WorkOrderService {

}
