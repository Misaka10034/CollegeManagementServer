package com.schmanagement.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NonNull;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * <p>
 * 
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Account implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("ID")
    //@NotNull(message = "id不为空")
    private Long id;

    @TableField("Password")
    //@NotBlank(message = "密码不为空")
    private String Password;

    @TableField("Kind")
    //@NotNull(message = "类型不为空")
    private Integer Kind;

}
