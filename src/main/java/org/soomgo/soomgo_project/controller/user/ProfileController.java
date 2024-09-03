package org.soomgo.soomgo_project.controller.user;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
import org.soomgo.soomgo_project.service.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/profile")
public class ProfileController {

    private final UserService userService;
    @GetMapping("")
    public String Profile(HttpSession session, Model model){
        UserDTO user = (UserDTO) session.getAttribute("user");
        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");
    if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("userprofile", userprofile);
            return "userpage/profile";
        }
    return "/login";
    }

}
