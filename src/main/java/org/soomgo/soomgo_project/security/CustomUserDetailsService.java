package org.soomgo.soomgo_project.security;

import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service // 이 어노테이션을 추가하여 빈으로 등록
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        System.out.println("email :"+email);
        UserDTO user = userService.getUserByEmail(email);

        System.out.println("user :"+user);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with email: " + email);
        }
        return new CustomUserDetails(user);
    }
}
