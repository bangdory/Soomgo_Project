package org.soomgo.soomgo_project.service.userpage;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.domain.userpage.UserProfileDTO;
import org.soomgo.soomgo_project.mappers.userpage.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;



    @Override
    public UserDTO getUserByEmailAndPassword(String email, String password) {
        return userMapper.findByEmailAndPassword(email, password);
    }

    @Override
    public UserProfileDTO getUserProfileByUserNum(int user_num) {
        return userMapper.findUserProfileByUserNum(user_num);
    }
    @Override
    public void updateUserProfile(UserProfileDTO userProfileDTO) {
        userMapper.updateUserProfile(userProfileDTO);
    }

}
