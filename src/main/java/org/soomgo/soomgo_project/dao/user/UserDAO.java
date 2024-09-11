//package org.soomgo.soomgo_project.dao.user;
//
//import lombok.RequiredArgsConstructor;
//import org.soomgo.soomgo_project.domain.user.UserDTO;
//import org.springframework.stereotype.Repository;
//
//@Repository
//@RequiredArgsConstructor
//public class UserDAO {
//
//    public UserDTO findByUsername(String username) {
//        return null;
//    }
//
//}

package org.soomgo.soomgo_project.dao.user;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
import org.soomgo.soomgo_project.mappers.user.UserMapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@RequiredArgsConstructor
public class UserDAO {

    private final UserMapper userMapper;

    public UserDTO findByEmailAndPassword(Map<String, Object> res) {
        return userMapper.findByEmailAndPassword(res);
    }

    public UserProfileDTO findUserProfileByUserNum(int userNum) {
        return userMapper.findUserProfileByUserNum(userNum);
    }

    public void updateUserProfile(UserProfileDTO userProfileDTO) {
        userMapper.updateUserProfile(userProfileDTO);
    }

    public UserDTO findByUsername(String username) {
        return null;
    }

    public int searchPhone (String phone) {
        return userMapper.searchPhone(phone);
    }

}
