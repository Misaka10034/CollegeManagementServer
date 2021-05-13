package com.schmanagement.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import java.sql.Blob;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.NotNull;

/**
 * <p>
 * 学生表
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Student implements Serializable {

    private static final long serialVersionUID = 2L;

    /**
     * 学号
     */
    @TableId(value = "ID", type = IdType.AUTO)
    @NotNull(message = "用户账号不能为空")
    private Long id;

    @TableField("Password")
    @NotBlank(message = "用户密码不能为空")
    private String Password;

    @TableField("Name")
    @NotBlank(message = "用户姓名不能为空")
    private String Name;

    @TableField("Birth")
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private LocalDate Birth;

    @TableField("Sex")
    @NotNull(message ="性别不能为空")
    private Integer Sex;

    @TableField("Address")
    @NotBlank(message = "住址不能为空")
    private String Address;

    @TableField("PhoneNumber")
    @NotNull(message = "手机号不能为空")
    private Long PhoneNumber;

    @TableField("Grade")
    @NotNull(message = "年级不能为空")
    private Integer Grade;

    @TableField("Major")
    @NotBlank(message = "专业不能为空")
    private String Major;

    @TableField("Position")
    private String Position;

    /**
     * 社保号
     */
    @TableField("SIID")
    private Long siid;

    /**
     * 入学年份
     */
    @TableField("AdmissionTime")
    @NotNull(message = "入学时间不能为空")
    private Integer AdmissionTime;

    /**
     * 毕业年份
     */
    @TableField("GraduationTime")
    @NotNull(message = "毕业时间不能为空")
    private Integer GraduationTime;

    @TableField("Head")
    //@NotNull(message = "学生头像不能为空")
    private String Head;

    @TableField("Registered")
    private Boolean Registered;
}
