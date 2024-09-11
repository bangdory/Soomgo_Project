//package org.soomgo.soomgo_project.controller.user;
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.log4j.Log4j2;
//import org.soomgo.soomgo_project.domain.userpage.UserDTO;
//import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
//import org.soomgo.soomgo_project.service.user.UserService;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.io.File;
//import java.io.IOException;
//
//@Controller
//@RequestMapping("/userpage")
//@RequiredArgsConstructor
//@Log4j2
//public class UserPageController {
//
//    private final UserService userService;
//
//    @GetMapping("")
//    public String userPage(HttpSession session, Model model) {
//        UserDTO user = (UserDTO) session.getAttribute("user");
//        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");
//
//        if (user != null) {
//            model.addAttribute("user", user);
//            model.addAttribute("userprofile", userprofile);
//            return "userpage/userpage";
//        }
//        return "redirect:/login";
//    }
//
//    @GetMapping("/account_info")
//    public String accountInfo(HttpSession session, Model model) {
//        UserDTO user = (UserDTO) session.getAttribute("user");
//        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");
//
//        if (user != null) {
//            model.addAttribute("user", user);
//            model.addAttribute("userprofile", userprofile);
//            return "userpage/account_info";
//        }
//        return "redirect:/login";
//
//    }
//    @GetMapping("/account_info/setting")
//    public String accountSetting(HttpSession session, Model model) {
//        UserDTO user = (UserDTO) session.getAttribute("user");
//
//        if (user != null) {
//            model.addAttribute("user", user);
//            return "userpage/setting";
//        }
//        return "redirect:/login";
//    }
//
//    @PostMapping("/uploadProfileImage")
//    @ResponseBody
//    public ResponseEntity<String> uploadProfileImage(@RequestParam("user_img") MultipartFile file, HttpServletRequest request, HttpSession session) {
//        if (file.isEmpty()) {
//            return ResponseEntity.badRequest().body("이미지가 없습니다.");
//        }
//
//        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");
//        if (userprofile == null) {
//            return ResponseEntity.status(403).body("사용자 정보가 없습니다.");
//        }
//
//        try {
//
//            String uploadDir = request.getServletContext().getRealPath("/resources/static/img");
//
//            File uploadDirFile = new File(uploadDir);
//            log.info(uploadDirFile.getAbsolutePath());
//            if (!uploadDirFile.exists()) {
//                if (uploadDirFile.mkdirs()) {
//                    System.out.println("Directory created successfully");
//                } else {
//                    System.out.println("Failed to create directory");
//                }
//            }
//
//            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
//            String filePath = uploadDir + File.separator + fileName;
//            log.info("여기가 실행이 되나 File Path: " + filePath);
//
//            file.transferTo(new File(filePath));
//
//            String dbFilePath = "/img/" + fileName;
//            userprofile.setProfile_img(dbFilePath);
//            userService.updateUserProfile(userprofile);
//            session.setAttribute("userprofile", userprofile);
//
//            return ResponseEntity.ok("이미지 업로드 성공");
//
//        } catch (IOException e) {
//            log.error("이미지 업로드 실패: ", e);
//            return ResponseEntity.status(500).body("이미지 업로드 실패");
//        }
//    }
//
//
//    @PostMapping("/setDefaultProfile")
//    @ResponseBody
//    public ResponseEntity<String> setDefaultProfile(HttpSession session) {
//        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");
//
//        if (userprofile == null) {
//            return ResponseEntity.status(403).body("사용자 정보가 없습니다.");
//        }
//
//        try {
//            userprofile.setProfile_img("/img/default.jpeg");
//            userService.updateUserProfile(userprofile);
//
//            session.setAttribute("userprofile", userprofile);
//
//            return ResponseEntity.ok("기본 프로필로 변경되었습니다.");
//
//        } catch (Exception e) {
//            log.error("기본 프로필 변경 실패: ", e);
//            return ResponseEntity.status(500).body("기본 프로필 변경 실패");
//        }
//
//    }
//    @PostMapping("/updateNickname")
//    @ResponseBody
//    public ResponseEntity<String> updateNickname(@RequestParam("newNickname") String newNickname, HttpSession session) {
//        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");
//
//        if (userprofile == null) {
//            return ResponseEntity.status(403).body("사용자 정보가 없습니다.");
//        }
//
//        try {
//            userprofile.setUser_nickname(newNickname);
//            userService.updateUserProfile(userprofile);
//            session.setAttribute("userprofile", userprofile);
//
//            return ResponseEntity.ok("닉네임 변경 성공");
//        } catch (Exception e) {
//            log.error("닉네임 변경 실패: ", e);
//            return ResponseEntity.status(500).body("닉네임 변경 실패");
//        }
//    }
//}

package org.soomgo.soomgo_project.controller.user;

import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
import org.soomgo.soomgo_project.service.user.UserService;
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
            return "user/userpage"; // 사용자 페이지로 이동
        }
        return "redirect:user/login"; // 사용자 정보가 없으면 로그인 페이지로 리디렉션
    }
    @GetMapping("/account_info")
    public String accountInfo(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        UserProfileDTO userprofile = (UserProfileDTO) session.getAttribute("userprofile");

        if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("userprofile",userprofile);

            return "user/account_info";
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

            return "user/account_info"; // 페이지 리로드 시 successMessage를 사용
        }
        return "redirect:user/login";
    }



}
