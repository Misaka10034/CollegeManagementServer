package com.schmanagement.entity;

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
 * @since 2021-04-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class NewTableForTest implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer idnewTableForTest;

    private String newTableForTestcol;


}
