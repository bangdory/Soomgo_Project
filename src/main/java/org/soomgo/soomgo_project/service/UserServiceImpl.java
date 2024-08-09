package org.soomgo.soomgo_project.service;

import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.domain.UserProfileDTO;
import org.soomgo.soomgo_project.mappers.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public UserDTO getUserByEmailAndPassword(String email, String password) {
        return userMapper.findByEmailAndPassword(email, password);
    }

    @Override
    public UserProfileDTO getUserProfileByUserNum(int user_num) {
        return userMapper.findUserProfileByUserNum(user_num);
    }
}
