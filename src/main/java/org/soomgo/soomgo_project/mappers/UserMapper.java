package org.soomgo.soomgo_project.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.UserDTO;

@Mapper
public interface UserMapper {
    UserDTO findByEmailAndPassword(String email, String password);
    void insertUser(UserDTO user);
}
