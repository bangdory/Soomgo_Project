package org.soomgo.soomgo_project.dao.userpage;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.domain.userpage.UserProfileDTO;
import org.soomgo.soomgo_project.mappers.userpage.UserMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class UserDAO {

    private final UserMapper userMapper;

    public UserDTO findByEmailAndPassword(String email, String password) {
        return userMapper.findByEmailAndPassword(email, password);
    }

    public UserProfileDTO findUserProfileByUserNum(int userNum) {
        return userMapper.findUserProfileByUserNum(userNum);
    }

    public void updateUserProfile(UserProfileDTO userProfileDTO) {
        userMapper.updateUserProfile(userProfileDTO);
    }
}
