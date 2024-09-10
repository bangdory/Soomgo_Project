////package org.soomgo.soomgo_project.service.userpage;
////
////import org.soomgo.soomgo_project.domain.userpage.UserDTO;
////import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
////
////public interface UserService {
////    UserDTO getUserByEmailAndPassword(String email, String password);
////    UserProfileDTO getUserProfileByUserNum(int user_num);
////    void updateUserProfile(UserProfileDTO userProfileDTO);
////}
//package org.soomgo.soomgo_project.service.userpage;
//
//import org.soomgo.soomgo_project.domain.user.UserDTO;
//import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
//
//import javax.mail.MessagingException;
//import java.io.UnsupportedEncodingException;
//import java.util.Optional;
//
//public interface UserService {
//
//    UserDTO getUserByEmailAndPassword(String email, String password);
//    UserProfileDTO getUserProfileByUserNum(int user_num);
//    void updateUserProfile(UserProfileDTO userProfileDTO);
//
//
//    int checkDuplEmail(String email);
//
//    UserDTO getUserByEmail(String email);
//
//    int getUserIdByEmail(String email);
//
//    // 회원정보 저장
//    int insertUserProfile(UserDTO user); // 유저 회원가입
//
//    // 회원정보 찾기
//    Optional<String> findByEmail(String email);
//    void sendPasswordResetEmail(String email) throws MessagingException, UnsupportedEncodingException;
//
//    Optional<String> findByNameAndPhoneNumber(String name, String phoneNumber);
//
//    boolean resetPasswordWithToken(String token, String newPassword);
//}

package org.soomgo.soomgo_project.service.user;

import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.domain.user.UserProfileDTO;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Optional;

public interface UserService {

    UserDTO getUserByEmailAndPassword(Map<String, Object> res);
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

    int searchPhone(String phone);

}
