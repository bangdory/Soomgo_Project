package org.soomgo.soomgo_project.dao.user;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserDAO {

    public UserDTO findByUsername(String username) {
        return null;
    }

}
