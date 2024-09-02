package org.soomgo.soomgo_project.domain.user;

import lombok.Data;

@Data
public class UserDTO {

    int user_num;
    String user_email;
    String user_password;
    String user_name;
    String user_phonenum;
    String user_type;
    String create_at;
    String user_sex;
    int grade;

}
