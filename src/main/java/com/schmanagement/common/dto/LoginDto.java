package com.schmanagement.common.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
public class LoginDto implements Serializable {
    @TableId("ID")
    @NotNull(message = "用户账号不能为空")
    private Long id;


    @NotBlank(message = "用户密码不能为空")
    @Length(min=3,max = 15)
    private String Password;
}
