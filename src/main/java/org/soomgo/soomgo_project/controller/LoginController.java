package org.soomgo.soomgo_project.controller;

import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session) {
        UserDTO user = userService.getUserByEmailAndPassword(email, password); // 사용자 인증
        if (user != null) {
            session.setAttribute("user", user); // 세션에 사용자 정보 저장
            return "redirect:/userpage"; // 로그인 후 사용자 페이지로 리디렉션
        }
        return "login"; // 로그인 실패 시 로그인 페이지로 돌아감
    }
}
