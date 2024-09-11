package org.soomgo.soomgo_project.service.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.soomgo.soomgo_project.config.MailConfig;
import org.soomgo.soomgo_project.domain.user.EmailVerificationTokenDTO;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.mappers.user.EmailVerificationTokenMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Random;

@Service
public class EmailServiceImpl implements EmailService {

    private static final Logger log = LoggerFactory.getLogger(EmailServiceImpl.class);
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private EmailVerificationTokenMapper emailVerificationTokenMapper;

    private static final SecureRandom secureRandom = new SecureRandom();
    private static final Base64.Encoder base64Encoder = Base64.getUrlEncoder();

    @Autowired
    @Lazy
    private UserService userService;
    @Autowired
    private MailConfig mailConfig;

    @Override
    public String sendValidationEmail(String email) throws MessagingException, UnsupportedEncodingException {

        MimeMessage MimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper message = new MimeMessageHelper(MimeMessage, true); // 'true' for HTML content

        log.info("email: " + email);

        String displayName = "숨고 프로젝트 팀"; // 이메일에 표시 될 이름
        String address = mailConfig.getUsername();

        EmailVerificationTokenDTO emailVerificationTokenDTO = new EmailVerificationTokenDTO();
        String verificationCode = generateVerificationCode();

        log.info("message: " + message);

        message.setTo(email);
        message.setFrom(address, displayName);

        message.setSubject("인증번호");
        message.setText("VerificationCode : " + verificationCode);

        mailSender.send(message.getMimeMessage());

        emailVerificationTokenDTO.setEmail(email);
        emailVerificationTokenDTO.setVerification_token(verificationCode);
        emailVerificationTokenDTO.setExpires(LocalDateTime.now().plusMinutes(10));

        int userId = userService.getUserIdByEmail(email);

        log.info("userId: " + userId);

        if (userId != -1) {
            emailVerificationTokenDTO.setUser_num(userId);
            emailVerificationTokenMapper.save(emailVerificationTokenDTO);
        }

        return verificationCode;
    }

    @Override
    public boolean validateToken(String token) {
        LocalDateTime now = LocalDateTime.now();
        EmailVerificationTokenDTO emailVerificationTokenDTO = emailVerificationTokenMapper.findByToken(token);

        if (emailVerificationTokenDTO != null) {
            return emailVerificationTokenDTO.getExpires().isAfter(LocalDateTime.now());
        }

        return false;
    }

    @Override
    public void sendResetPasswordEmail(String email) throws MessagingException {


        UserDTO userDTO = userService.getUserByEmail(email);

        MimeMessage MimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper message = new MimeMessageHelper(MimeMessage, true); // 'true' for HTML content

        try {

            if (userDTO == null) {
                throw new IllegalArgumentException("NotFound User Email : " + email);
            }

            int userNum = userDTO.getUser_num();

            String token = generateToken();
            System.out.println("token:" + token);

            EmailVerificationTokenDTO tokenDTO = emailVerificationTokenMapper.findByUserNum(userNum);
            if (tokenDTO != null) {
                tokenDTO.setVerification_token(token);
                tokenDTO.setExpires(LocalDateTime.now().plusMinutes(10));
                emailVerificationTokenMapper.updateToken(tokenDTO);
            } else {
                tokenDTO = new EmailVerificationTokenDTO();
                tokenDTO.setEmail(email);
                tokenDTO.setVerification_token(token);
                tokenDTO.setExpires(LocalDateTime.now().plusMinutes(10));
                emailVerificationTokenMapper.save(tokenDTO);
            }

            String resetLink = "http://localhost:8080/user/resetpasswordform?token=" + token;
//            String emailContent = "Password ResetLink : " + resetLink;
            String emailContent = "<html><body>"
                    + "<p>Password Reset Link:</p>"
                    + "<a href=\"" + resetLink + "\">" + resetLink + "</a>"
                    + "</body></html>";


//        SimpleMailMessage message = new SimpleMailMessage();

            String displayName = "숨고 프로젝트 팀"; // 이메일에 표시 될 이름
            String address = mailConfig.getUsername();
            message.setFrom(address, displayName); // 발신자 이메일 주소


            message.setTo(email);
            message.setSubject("비밀번호 변경");
            message.setText(emailContent, true);

            mailSender.send(message.getMimeMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String generateVerificationCode() {
        Random random = new Random();
        int code = random.nextInt(999999);
        return String.format("%06d", code);
    }

    private String generateToken() {
        byte[] randomBytes = new byte[24];
        secureRandom.nextBytes(randomBytes);
        return base64Encoder.encodeToString(randomBytes);
    }
}
