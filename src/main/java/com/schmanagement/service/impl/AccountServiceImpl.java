package com.schmanagement.service.impl;

import com.schmanagement.entity.Account;
import com.schmanagement.mapper.AccountMapper;
import com.schmanagement.service.AccountService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-11
 */
@Service
public class AccountServiceImpl extends ServiceImpl<AccountMapper, Account> implements AccountService {

}
