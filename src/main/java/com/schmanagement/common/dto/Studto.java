package com.schmanagement.common.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.sql.Blob;
import java.time.LocalDate;
@Data
public class Studto implements Serializable {
    @TableId(value = "ID", type = IdType.AUTO)
    @NotNull(message = "用户账号不能为空")
    private Long id;
}
