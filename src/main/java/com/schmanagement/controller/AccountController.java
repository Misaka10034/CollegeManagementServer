package com.schmanagement.controller;


import com.schmanagement.entity.Account;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-11
 */
@RestController
@RequestMapping("/account")
public class AccountController {
    @PostMapping("/save")
    public Object testAccount(@Validated @RequestBody Account account) {
        return account.toString();
    }
}

