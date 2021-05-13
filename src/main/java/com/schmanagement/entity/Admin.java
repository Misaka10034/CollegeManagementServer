package com.schmanagement.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.sql.Blob;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * <p>
 * 
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Admin implements Serializable {

    private static final long serialVersionUID = 3L;

    @TableId(value = "ID", type = IdType.AUTO)
    @NotNull(message = "用户账号不能为空")
    private Long id;

    @TableField("Name")
    @NotBlank(message = "用户姓名不能为空")
    private String Name;

    @TableField("Password")
    @NotBlank(message = "用户密码不能为空")
    private String Password;

    @TableField("Head")
    private Blob Head;


}
