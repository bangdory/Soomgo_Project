package org.soomgo.soomgo_project.controller.userpage;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.domain.userpage.UserProfileDTO;
import org.soomgo.soomgo_project.service.userpage.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/userpage")
@RequiredArgsConstructor
@Log4j2
public class UserPageController {

    private final UserService userService;

    @GetMapping("")
    public String userPage(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");

        if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("userprofile", userprofile);
            return "userpage/userpage"; // 사용자 페이지로 이동
        }
        return "redirect:/login"; // 사용자 정보가 없으면 로그인 페이지로 리디렉션
    }

    @GetMapping("/account_info")
    public String accountInfo(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");

        if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("userprofile", userprofile);
            return "userpage/account_info";
        }

        return "redirect:/login";
    }

    @PostMapping("/update_nickname")
    public String updateNickname(@RequestParam("user_nickname") String newNickname, HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user != null) {
            UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");

            if (userprofile != null) {
                if (!userprofile.getUser_nickname().equals(newNickname)) {
                    userprofile.setUser_nickname(newNickname);
                    userService.updateUserProfile(userprofile);

                    session.setAttribute("userprofile", userprofile);

                    model.addAttribute("user", user);
                    model.addAttribute("userprofile", userprofile);
                    model.addAttribute("successMessage", "닉네임이 성공적으로 변경되었습니다.");
                }
            }

            return "userpage/account_info";
        }
        return "redirect:/login";
    }
}
