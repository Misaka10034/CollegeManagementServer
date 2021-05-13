package com.schmanagement.shiro;

import lombok.Data;
import java.io.Serializable;

@Data
public class UserProfile implements Serializable {

    private Long id;

    private String Password;

}
