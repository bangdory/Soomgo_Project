package org.soomgo.soomgo_project.controller;

import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.UserDTO;
import org.soomgo.soomgo_project.domain.UserProfileDTO;
import org.soomgo.soomgo_project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@RequestMapping("/userpage")
@Controller
@Log4j2
public class UserPageController {

    private final UserService userService; // UserService 필드 추가

    @Autowired // 생성자 주입을 위한 Autowired 애노테이션 추가
    public UserPageController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("")
    public String userPage(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");
        if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("userprofile",userprofile);
            return "userpage"; // 사용자 페이지로 이동
        }
        return "redirect:/login"; // 사용자 정보가 없으면 로그인 페이지로 리디렉션
    }
    @GetMapping("/account_info")
    public String accountInfo(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");

        if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("userprofile",userprofile);

            return "account_info";
        }

        return "redirect:/login";
    }
    @PostMapping("/update_nickname")
    public String updateNickname(@RequestParam("user_nickname") String newNickname, HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user != null) {
            UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");

            if (userprofile != null) {
                // 기존 닉네임과 새로운 닉네임이 다를 때만 업데이트 진행
                if (!userprofile.getUser_nickname().equals(newNickname)) {
                    userprofile.setUser_nickname(newNickname);

                    userService.updateUserProfile(userprofile);

                    session.setAttribute("userprofile", userprofile);

                    model.addAttribute("user", user);
                    model.addAttribute("userprofile", userprofile);
                    model.addAttribute("successMessage", "닉네임이 성공적으로 변경되었습니다.");
                }
            }

            return "account_info"; // 페이지 리로드 시 successMessage를 사용
        }
        return "redirect:/login";
    }



}
