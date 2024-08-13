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
}
