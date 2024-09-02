package org.soomgo.soomgo_project.security;

import org.soomgo.soomgo_project.domain.UserDTO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;

public class CustomUserDetails implements UserDetails {

    private final UserDTO user;

    public CustomUserDetails(UserDTO user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // 여기에서는 기본적으로 'ROLE_USER' 권한을 부여.
        // 필요에 따라 다양한 권한을 추가할수 있음.
        return Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"));
    }

    @Override
    public String getPassword() {
        System.out.println("getPassword:"+user.getUser_password());
        return user.getUser_password(); // UserDTO 객체의 비밀번호 반환
    }

    @Override
    public String getUsername() {
        return user.getUser_email(); // UserDTO 객체의 이메일 반환
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; // 계정 만료 여부를 설정할 수 있음
    }

    @Override
    public boolean isAccountNonLocked() {
        return true; // 계정 잠김 여부를 설정할 수 있음
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true; // 비밀번호 만료 여부를 설정할 수 있음
    }

    @Override
    public boolean isEnabled() {
        return true; // 계정 활성화 여부를 설정할 수 있음
    }

    public UserDTO getUser() {
        return user;
    }
}
