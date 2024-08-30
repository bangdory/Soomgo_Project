package org.soomgo.soomgo_project.domain.userpage;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class UserDTO {
    private int user_num;
    private String user_email;
    private String user_password;
    private String user_name;
    private int user_phonenum;


    // 0830 RequestController 에서 검증을 위해 private -> public 으로 변경
    public enum UserType{
        CUSTOMER,EXPERT
    }
    private UserType user_type;


    private LocalDateTime create_at;

    public enum UserSex {
        남성, 여성
    }

    private UserSex user_sex;
}
