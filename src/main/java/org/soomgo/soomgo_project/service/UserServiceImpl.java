package org.soomgo.soomgo_project.service;

import org.soomgo.soomgo_project.domain.UserDTO;
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
        return userMapper.findByEmailAndPassword(email, password); // 사용자 정보를 조회하는 메소드
    }

    @Override
    public void insertUser(UserDTO userDTO) {
        userMapper.insertUser(userDTO);
    }
}
