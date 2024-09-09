package org.soomgo.soomgo_project.controller.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
import org.soomgo.soomgo_project.security.CustomUserDetails;
import org.soomgo.soomgo_project.service.category.CategoryServiceImpl;
import org.soomgo.soomgo_project.service.territory.TerritoryServiceImpl;
import org.soomgo.soomgo_project.service.user.UserService;
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
import java.util.*;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Log4j2
public class LoginController {


    private final UserService userService;
    private final AuthenticationManager authenticationManager;
    private final PasswordEncoder passwordEncoder;
    private final CategoryServiceImpl categoryServiceImpl;
    private final TerritoryServiceImpl territoryServiceImpl;

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
    //     * @param request
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
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            CustomUserDetails userDetails = (CustomUserDetails)principal;

            HttpSession session = request.getSession();
            UserDTO userDTO = userDetails.getUser();
            session.setAttribute("sess_user_name", userDTO.getUser_name());
            session.setAttribute("sess_user_num" , userDTO.getUser_num());
            session.setAttribute("sess_user_type", userDTO.getUser_type());

            System.out.println("test : " + session.getAttribute("sess_user_name"));

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

//    @PostMapping("/login")
//    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
//        log.info("login Post 맵핑 진행 중......");
//
//        Map<String, Object> res = new HashMap<>();
//        res.put("email", email);
//
//        String encodePassword = passwordEncoder.encode(password);
//
//        res.put("password", encodePassword);
//        UserDTO user = userService.getUserByEmailAndPassword(res);
//        log.info("user : " + user);
//
//
//        if (user != null) {
//            session.setAttribute("user", user);
//            log.info(user);
//            UserProfileDTO userprofile = userService.getUserProfileByUserNum(user.getUser_num());
//            session.setAttribute("usertype", user.getUser_type());
//            log.info(user.getUser_type());
//
//            session.setAttribute("userprofile", userprofile); // 사용자 프로필 정보를 세션에 저장
//            log.info(userprofile);
//
//            return "redirect:/user/login"; // 로그인 후 사용자 페이지로 리디렉션
//        } else {
//            model.addAttribute("errorMessage", "이메일 또는 비밀번호가 잘못되었습니다.");
//            return "/user/login"; // 로그인 실패 시 로그인 페이지로 돌아감
//        }
//    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "/user/login"; // 로그인 폼을 보여주는 JSP 파일
    }


    // 로그아웃 처리 핸들러
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/user/login"; // 로그아웃 후 로그인 페이지로 리디렉션
    }


    /**
     * 회원가입 페이지 이동
     * @return
     */
    @GetMapping("/signup")
    public String signup(Model model) {

        try {
            List<CategoryDTO> category = categoryServiceImpl.getCategoryNotZero();
            List<TerritoryDTO> territory = territoryServiceImpl.getTerritory();

            log.info(territory);

            model.addAttribute("territory", territory);
            model.addAttribute("category", category);

        }catch (Exception e) {
            e.printStackTrace();
        }

        return "/user/signup";
    }

    /**
     * 회원 이메일 찾기 페이지 이동
     * @return
     */
    @GetMapping("/findUserEmail")
    public String findUserId() {
        return "/user/findUserEmail";
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

        return "/user/findUserEmail";
    }


    @GetMapping("/reset-password")
    public String resetPassword() {
        return "/user/reset-password";
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
        return "/user/resetPasswordForm";
    }
}
