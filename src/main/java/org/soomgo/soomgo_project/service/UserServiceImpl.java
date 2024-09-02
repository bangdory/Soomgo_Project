package org.soomgo.soomgo_project.service;

import org.soomgo.soomgo_project.domain.EmailVerificationTokenDTO;
import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.domain.UserProfileDTO;
import org.soomgo.soomgo_project.mappers.EmailVerificationTokenMapper;
import org.soomgo.soomgo_project.mappers.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    private final EmailService emailService;
    private final PasswordEncoder passwordEncoder;
    private final EmailVerificationTokenMapper emailVerificationTokenMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper, EmailService emailService,
                           PasswordEncoder passwordEncoder, EmailVerificationTokenMapper emailVerificationTokenMapper) {
        this.userMapper = userMapper;
        this.emailService = emailService;
        this.passwordEncoder = passwordEncoder;
        this.emailVerificationTokenMapper = emailVerificationTokenMapper;
    }

    @Override
    public UserDTO getUserByEmailAndPassword(String email, String password) {
        return userMapper.findByEmailAndPassword(email, password);
    }

    @Override
    public UserProfileDTO getUserProfileByUserNum(int user_num) {
        return userMapper.findUserProfileByUserNum(user_num);
    }

    @Override
    public void updateUserProfile(UserProfileDTO userProfileDTO) {
        userMapper.updateUserProfile(userProfileDTO);
    }

    @Override
    public int checkDuplEmail(String email) {
        return userMapper.checkDuplEmail(email);
    }

    @Override
    public UserDTO getUserByEmail(String email) {
        return userMapper.findByEmail(email);
    }

    @Override
    public int insertUserProfile(UserDTO userDTO) {
        // 비밀번호를 암호화
        //String rawPassword = userDTO.getUser_password();
        //String encodedPassword = passwordEncoder.encode(rawPassword);
        //userDTO.setUser_password(encodedPassword);

        // 암호화된 비밀번호로 사용자 정보를 DB에 저장
        return userMapper.insertUserInfo(userDTO);
    }

    @Override
    public Optional<String> findByEmail(String email) {
        System.out.println("findByEmail email " + email);
        UserDTO userDTO = userMapper.findByEmail(email);
        System.out.println("user:" + userDTO);
        return Optional.ofNullable(userDTO != null ? userDTO.getUser_name() : null);
    }

    @Override
    public void sendPasswordResetEmail(String email) throws MessagingException, UnsupportedEncodingException {
        UserDTO userDTO = userMapper.findByEmail(email);
        if (userDTO != null) {
            emailService.sendResetPasswordEmail(email);
        }
    }

    @Override
    public int getUserIdByEmail(String email) {
        UserDTO userDTO = userMapper.findByEmail(email);
        if (userDTO != null) {
            return userDTO.getUser_num();
        }
        return -1;
    }

    @Override
    public Optional<String> findByNameAndPhoneNumber(String name, String phoneNumber) {
        UserDTO userDTO = userMapper.findUserByNameAndPhoneNumber(name, phoneNumber);
        return userDTO != null ? Optional.of(userDTO.getUser_email()) : Optional.empty();
    }

    @Override
    public boolean resetPasswordWithToken(String token, String newPassword) {
        EmailVerificationTokenDTO tokenDTO = emailVerificationTokenMapper.findByToken(token);

        if (tokenDTO != null && tokenDTO.getExpires().isAfter(LocalDateTime.now())) {
            String encodedPassword = passwordEncoder.encode(newPassword);
            userMapper.updatePassword(tokenDTO.getUser_num(), encodedPassword);
            return true;
        }
        return false;
    }
}
