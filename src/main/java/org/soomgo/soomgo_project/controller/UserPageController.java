package org.soomgo.soomgo_project.controller;

import org.soomgo.soomgo_project.domain.UserDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserPageController {

    @GetMapping("/userpage")
    public String userPage(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user"); // 세션에서 사용자 정보 가져오기
        if (user != null) {
            model.addAttribute("user", user); // 모델에 사용자 정보 추가
            return "userpage"; // 사용자 페이지로 이동
        }
        return "redirect:/login"; // 사용자 정보가 없으면 로그인 페이지로 리디렉션
    }
}
