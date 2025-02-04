package org.soomgo.soomgo_project.domain.user;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UserDTO {
    private int user_num;
    private String user_email;
    private String user_password;
    private String user_name;
    private String user_phonenum;
    private int grade;

    public enum UserType {
        CUSTOMER, EXPERT
    }

    private UserType user_type;
    private LocalDateTime create_at;

    public enum UserSex {
        남성, 여성
    }

    private UserSex user_sex;
}
