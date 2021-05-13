package com.schmanagement.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
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
 * @since 2021-03-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    @NotNull(message = "消息编号不能为空")
    private Long id;

    @TableField("Message")
    @NotBlank(message = "消息内容不能为空")
    private String Message;

    @TableField("OriginID")
    @NotNull(message = "发送人ID不能为空")
    private Long OriginID;

    @TableField("TargetID")
    @NotNull(message = "接收者ID不能为空")
    private Long TargetID;

    @TableField("Time")
    @NotBlank(message = "发送时间不能为空")
    private LocalDateTime Time;

    @TableField("Readed")
    @NotNull(message = "已读情况不能为空")
    private Integer Readed;


}
