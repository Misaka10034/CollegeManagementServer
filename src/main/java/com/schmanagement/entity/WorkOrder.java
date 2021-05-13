package com.schmanagement.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

/**
 * <p>
 * 工单
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-03-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class WorkOrder implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    /**
     * 显示要显示管理员或教师具体姓名
     */
    @TableField("TargetID")
    @NotNull(message = "目标账号不能为空")
    private Long TargetID;

    @TableField("OriginID")
    @NotNull(message = "发送账号不能为空")
    private Long OriginID;

    /**
     * 工单内容
     */
    @TableField("Message")
    @NotBlank(message = "工单内容不能为空")
    private String Message;

    /**
     * 工单种类
     */
    @TableField("Kind")
    @NotNull(message = "工单类型不能为空")
    private Integer Kind;

    @TableField("Finished")
    @NotNull(message = "工单状态不能为空")
    private Integer Finished;


}
