package com.schmanagement.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * <p>
 * 奖惩信息表
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-01
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class PunishReward implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 奖惩信息处理流水号
     */
    @TableId(value = "ID", type = IdType.AUTO)
    @NotNull(message = "处理编号不能为空")
    private Integer id;

    @TableField("StuID")
    @NotNull(message = "学生账号不能为空")
    private Long StuID;

    /**
     * 处理人信息
     */
    @TableField("AdminID")
    @NotNull(message = "管理员账号不能为空")
    private Long AdminID;

    /**
     * 奖励还是惩处
     */
    @TableField("RewardorPunish")
    @NotNull(message = "类别不能为空")
    private Integer RewardorPunish;

    /**
     * 具体奖惩
     */
    @TableField("DetailedInfo")
    @NotBlank(message = "处理详情不能为空")
    private String DetailedInfo;

    /**
     * 奖惩原因
     */
    @TableField("Reason")
    @NotBlank(message = "奖惩理由不能为空")
    private String Reason;

    @TableField("CertificateImage")
    private String CertificateImage;

    @TableField("Finished")
    private Integer Finished;
}
