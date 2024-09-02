package org.soomgo.soomgo_project.service.userpage;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.userpage.UserDAO;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.domain.userpage.UserProfileDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserDAO userDAO;

    @Override
    public UserDTO getUserByEmailAndPassword(String email, String password) {
        return userDAO.findByEmailAndPassword(email, password);
    }

    @Override
    public UserProfileDTO getUserProfileByUserNum(int user_num) {
        return userDAO.findUserProfileByUserNum(user_num);
    }

    @Override
    public void updateUserProfile(UserProfileDTO userProfileDTO) {
        userDAO.updateUserProfile(userProfileDTO);
    }
}
