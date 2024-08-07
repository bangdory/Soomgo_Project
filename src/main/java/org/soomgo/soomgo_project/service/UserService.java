package org.soomgo.soomgo_project.service;

import org.soomgo.soomgo_project.domain.UserDTO;

public interface UserService {
    UserDTO getUserByEmailAndPassword(String email, String password);
    void insertUser(UserDTO userDTO);
}
