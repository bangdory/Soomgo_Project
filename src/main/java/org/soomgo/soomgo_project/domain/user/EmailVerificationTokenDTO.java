package org.soomgo.soomgo_project.domain.user;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class EmailVerificationTokenDTO {
    private int verification_id;
    private int user_num;
    private String email;
    private String verification_token;
    private LocalDateTime expires;
}
