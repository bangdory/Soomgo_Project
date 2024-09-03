package org.soomgo.soomgo_project.mappers.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.soomgo.soomgo_project.domain.user.EmailVerificationTokenDTO;

@Mapper
public interface EmailVerificationTokenMapper {
    void save(EmailVerificationTokenDTO emailVerificationTokenDTO);
    EmailVerificationTokenDTO findByToken(@Param("verification_token") String token);

    // user_num으로 토큰 찾기
    EmailVerificationTokenDTO findByUserNum(@Param("user_num") int userNum);

    void updateToken(EmailVerificationTokenDTO tokenDTO);
}
