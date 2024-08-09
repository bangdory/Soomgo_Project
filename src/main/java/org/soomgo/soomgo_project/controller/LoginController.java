package org.soomgo.soomgo_project.controller;

import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.domain.UserProfileDTO;
import org.soomgo.soomgo_project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    private final UserService userService;

    @Autowired
    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
        UserDTO user = userService.getUserByEmailAndPassword(email, password);
        if (user != null) {
            session.setAttribute("user", user);
            UserProfileDTO userProfile = userService.getUserProfileByUserNum(user.getUser_num());
            session.setAttribute("userProfile", userProfile); // 사용자 프로필 정보를 세션에 저장
            return "redirect:/userpage"; // 로그인 후 사용자 페이지로 리디렉션
        } else {
            model.addAttribute("errorMessage", "이메일 또는 비밀번호가 잘못되었습니다.");
            return "login"; // 로그인 실패 시 로그인 페이지로 돌아감
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
}
