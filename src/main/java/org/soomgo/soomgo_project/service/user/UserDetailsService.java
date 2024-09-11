package org.soomgo.soomgo_project.service.user;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.user.UserDAO;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserDetailsService {


    private final UserDAO userDAO;

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 데이터베이스에서 사용자 정보를 DTO 형태로 가져오기
        UserDTO userDTO = userDAO.findByUsername(username);

        if (userDTO == null) {
            throw new UsernameNotFoundException("User not found");
        }

        // CustomUserDetails 생성 및 반환
        return new CustomUserDetails(userDTO.getUser_email(), userDTO.getUser_password(), userDTO.getGrade());
    }
}