package org.soomgo.soomgo_project.service.userpage;

import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.domain.userpage.UserProfileDTO;

public interface UserService {
    UserDTO getUserByEmailAndPassword(String email, String password);
    UserProfileDTO getUserProfileByUserNum(int user_num);
    void updateUserProfile(UserProfileDTO userProfileDTO);
}
