package org.soomgo.soomgo_project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.domain.UserProfileDTO;
import org.soomgo.soomgo_project.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Optional;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Log4j2
public class LoginController {


    private final UserService userService;
    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder passwordEncoder;

    /**
     * 이메일 중복 체크
     * @param email
     * @return
     */
    @GetMapping("/checkEmail")
    @ResponseBody
    public HashMap<String, Object> checkEmail(@RequestParam String email) {
        System.out.println("email :: " + email);
        int cnt = userService.checkDuplEmail(email);
        HashMap<String, Object> res = new HashMap<>();
        res.put("result", cnt > 0 ? "fail" : "success");
        return res;
    }

    /**
     * 로그인 처리
     * @param email
     * @param password
     * @param request
     * @return
     */
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestParam String email,
                                   @RequestParam String password,
                                   HttpServletRequest request) {
        try {
            // 인증 요청 생성
            UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(email, password);

            // 인증 처리
            Authentication authentication = authenticationManager.authenticate(authRequest);

            SecurityContextHolder.getContext().setAuthentication(authentication);

            // 인증 성공 로그
            System.out.println("Authentication successful for user: " + email);
            return ResponseEntity.ok().body("로그인 성공");

        } catch (Exception e) {
            // 인증 실패 로그
            System.err.println("Authentication failed for user: " + email + ", error: " + e.getMessage());
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 실패: " + e.getMessage());
        }
    }





    /**
     * 로그아웃 처리
     * @param session
     * @return
     */

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
        UserDTO user = userService.getUserByEmailAndPassword(email, password);


        if (user != null) {
            session.setAttribute("user", user);
            UserProfileDTO userprofile = userService.getUserProfileByUserNum(user.getUser_num());
            session.setAttribute("usertype", user.getUser_type());

            session.setAttribute("userprofile", userprofile); // 사용자 프로필 정보를 세션에 저장

            return "redirect:/"; // 로그인 후 사용자 페이지로 리디렉션
        } else {
            model.addAttribute("errorMessage", "이메일 또는 비밀번호가 잘못되었습니다.");
            return "/login"; // 로그인 실패 시 로그인 페이지로 돌아감
        }
    }
    @GetMapping("/login")
    public String showLoginForm() {
        return "login"; // 로그인 폼을 보여주는 JSP 파일
    }


    // 로그아웃 처리 핸들러
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/login"; // 로그아웃 후 로그인 페이지로 리디렉션
    }


    /**
     * 회원가입 페이지 이동
     * @return
     */
    @GetMapping("/signup")
    public String signup() {
        return "signup";
    }

    /**
     * 회원 이메일 찾기 페이지 이동
     * @return
     */
    @GetMapping("/findUserEmail")
    public String findUserId() {
        return "findUserEmail";
    }

    /**
     * 회원가입 처리
     * @param userDTO
     * @param request
     * @return
     */
    @PostMapping("/signup")
    public ResponseEntity<Integer> signup(@RequestBody UserDTO userDTO, HttpServletRequest request) {
        String rawPassword = userDTO.getUser_password();
        userDTO.setUser_password(passwordEncoder.encode(rawPassword));

        int isSignValid = userService.insertUserProfile(userDTO);

        return ResponseEntity.ok(isSignValid);
    }

    /**
     * 회원 이메일 찾기
     * @param name
     * @param phoneNumber
     * @param model
     * @return
     */
    @PostMapping("/findUserEmail")
    public String findUserEmail(@RequestParam("name") String name,
                                @RequestParam("phoneNumber") String phoneNumber,
                                Model model) {
        System.out.println("findUserEmail name: " + name + ", phoneNumber: " + phoneNumber);
        Optional<String> email = userService.findByNameAndPhoneNumber(name, phoneNumber);

        if (email.isPresent()) {
            model.addAttribute("email", email.get());
        } else {
            model.addAttribute("error", "사용자를 찾을 수 없습니다.");
        }

        return "findUserEmail";
    }


    @GetMapping("/reset-password")
    public String resetPassword() {
        return "reset-password";
    }

    /**
     * 비밀번호 재설정 요청
     * @param email
     * @return
     */
    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestParam(value = "user_email") String email) throws MessagingException, UnsupportedEncodingException {
        userService.sendPasswordResetEmail(email);
        return ResponseEntity.ok(HttpStatus.ACCEPTED);
    }

    @GetMapping("/resetpasswordform")
    public String resetpasswordform() {
        return "resetPasswordForm";
    }
}
