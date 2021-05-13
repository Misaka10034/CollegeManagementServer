package com.schmanagement.service.impl;

import com.schmanagement.entity.Message;
import com.schmanagement.mapper.MessageMapper;
import com.schmanagement.service.MessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-03-08
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, Message> implements MessageService {

}
