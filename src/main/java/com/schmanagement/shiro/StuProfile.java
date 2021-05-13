package com.schmanagement.shiro;
import lombok.Data;
import java.io.Serializable;
import java.time.LocalDate;

@Data
public class StuProfile implements Serializable {

    private static final long serialVersionUID = 2L;


    private Long id;

    private String Password;

    private String Name;

    private LocalDate Birth;

    private Integer Sex;

    private String Address;

    private Long PhoneNumber;

    private Integer Grade;

    private String Major;

    private String Position;

    private Long siid;

    private Integer AdmissionTime;

    private Integer GraduationTime;

    private String Head;

    private Boolean Registered;

}
