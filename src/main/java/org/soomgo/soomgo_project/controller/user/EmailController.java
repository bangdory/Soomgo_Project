package org.soomgo.soomgo_project.controller.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.soomgo.soomgo_project.service.user.EmailService;
import org.soomgo.soomgo_project.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;

@RestController
@RequestMapping("/api")
public class EmailController {

    private static final Logger log = LoggerFactory.getLogger(EmailController.class);
    @Autowired
    private EmailService emailService;
    private String savedVerificationCode;

    @Autowired
    private UserService userService;

    /**
     * 이메일 인증을 위한 인증코드 발송
     * @param email
     * @return
     */
    @PostMapping("/send-verification-email")
    public String sendVerificationEmail(@RequestParam(value = "user_email") String email) throws MessagingException, UnsupportedEncodingException {
        // 이메일로 인증 코드 발송
        savedVerificationCode = emailService.sendValidationEmail(email);
        log.info("Email sent: " + savedVerificationCode);
        return "이메일 인증 코드 발송 : " + email;
    }

    /**
     * 이메일 인증코드 입력 후 해당 인증코드가 일치한지와 유효시간이 지났는지 확인
     * @param code
     * @return
     */
    @PostMapping("/verifyCode")
    public String verifyCode(@RequestParam(value = "token") String code) {
        // 입력된 인증 코드와 저장된 인증 코드 비교
        boolean isValidToken = emailService.validateToken(code);
        if (isValidToken) {
            return "Verification successful!";
        } else {
            return "토큰 유효시간이 만료되었거나 코드가 일치하지 않음";
        }
    }

    /**
     * 비밀번호 재설정 확인
     * @param token
     * @param newPassword
     * @return
     */
    @PostMapping("/reset-password-confirm")
    public ResponseEntity<String> resetPasswordConfirm(
            @RequestParam(value = "token") String token,
            @RequestParam(value = "new_password") String newPassword) {

        System.out.println("token:"+token);
        System.out.println("newPassword:"+newPassword);

        boolean isReset = userService.resetPasswordWithToken(token, newPassword);
        if (isReset) {
            return ResponseEntity.ok("비밀번호가 성공적으로 변경되었습니다.");
        } else {
            return ResponseEntity.badRequest().body("유효하지 않은 토큰이거나 만료되었습니다.");
        }
    }
}
