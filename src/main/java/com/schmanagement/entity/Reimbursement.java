package com.schmanagement.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author M1saka_10034
 * @since 2021-04-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Reimbursement implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    @TableField("OriginID")
    private Long OriginID;

    @TableField("Image1")
    private String Image1;

    @TableField("Image2")
    private String Image2;

    @TableField("Image3")
    private String Image3;

    @TableField("TargetID")
    private Long TargetID;

    @TableField("Finished")
    private Integer Finished;

    @TableField("Message")
    private String Message;

    @TableField("SIID")
    private Long siid;


}
