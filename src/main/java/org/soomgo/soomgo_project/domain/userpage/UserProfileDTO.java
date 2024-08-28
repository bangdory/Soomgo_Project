package org.soomgo.soomgo_project.domain.userpage;

import lombok.Data;

@Data
public class UserProfileDTO {
    private String profile_id;
    private int user_num;
    private String user_nickname;
    private String user_addr;
    private String profile_img;
    private String introduce;
}
