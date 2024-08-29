package org.soomgo.soomgo_project.mappers.userpage;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.domain.userpage.UserProfileDTO;

import java.util.List;

@Mapper
public interface UserMapper {

    UserDTO findByEmailAndPassword(@Param("email") String email, @Param("password") String password);

    UserProfileDTO findUserProfileByUserNum(@Param("user_num") int userNum);

    void updateUserProfile(UserProfileDTO userProfileDTO);
}
