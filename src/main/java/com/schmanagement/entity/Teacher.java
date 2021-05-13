package com.schmanagement.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.sql.Blob;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

/**
 * <p>
 * 教师表
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    @NotNull(message = "用户账号不能为空")
    private Long id;

    @TableField("Password")
    @NotBlank(message = "用户密码不能为空")
    private String Password;

    @TableField("Name")
    @NotBlank(message = "用户姓名不能为空")
    private String Name;

    @TableField("Sex")
    @NotNull(message = "用户性别不能为空")
    private Boolean Sex;

    @TableField("Position")
    private String Position;

    @TableField("PhoneNum")
    @NotNull(message = "用户电话不能为空")
    private Long PhoneNum;

    @TableField("Email")
    @Email(message="邮件格式不正确")
    @NotBlank(message = "邮箱不能为空")
    private String Email;

    @TableField("College")
    @NotBlank(message = "用户学院所属不能为空")
    private String College;

    @TableField("Head")
//    @NotNull(message = "用户头像不能为空")
    private String Head;

    @TableField("Registered")
    private Boolean Registered;
}
