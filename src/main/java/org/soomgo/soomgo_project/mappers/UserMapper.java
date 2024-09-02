package org.soomgo.soomgo_project.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.domain.UserProfileDTO;

@Mapper
public interface UserMapper {
    UserDTO findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
    UserProfileDTO findUserProfileByUserNum(@Param("user_num") int userNum);
    void updateUserProfile(UserProfileDTO userProfileDTO);


    int checkDuplEmail(@Param("email") String email);

    UserDTO findByEmail(@Param("email") String email);

    // 회원정보 저장
    int insertUserInfo(UserDTO userDTO);

    UserDTO findUserByNameAndPhoneNumber(@Param("name") String name, @Param("phoneNumber") String phoneNumber);

    void updatePassword(@Param("user_num") int userNum, @Param("user_password") String newPassword);
}
