package org.soomgo.soomgo_project.service;

import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.domain.UserProfileDTO;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.Optional;

public interface UserService {

    UserDTO getUserByEmailAndPassword(String email, String password);
    UserProfileDTO getUserProfileByUserNum(int user_num);
    void updateUserProfile(UserProfileDTO userProfileDTO);


    int checkDuplEmail(String email);

    UserDTO getUserByEmail(String email);

    int getUserIdByEmail(String email);

    // 회원정보 저장
    int insertUserProfile(UserDTO user); // 유저 회원가입

    // 회원정보 찾기
    Optional<String> findByEmail(String email);
    void sendPasswordResetEmail(String email) throws MessagingException, UnsupportedEncodingException;

    Optional<String> findByNameAndPhoneNumber(String name, String phoneNumber);

    boolean resetPasswordWithToken(String token, String newPassword);
}
