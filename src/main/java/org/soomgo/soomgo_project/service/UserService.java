package org.soomgo.soomgo_project.service;

import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.domain.UserProfileDTO;

public interface UserService {
    UserDTO getUserByEmailAndPassword(String email, String password);
    UserProfileDTO getUserProfileByUserNum(int user_num);
    void updateUserProfile(UserProfileDTO userProfileDTO);
}
