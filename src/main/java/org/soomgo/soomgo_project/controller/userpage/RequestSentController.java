package org.soomgo.soomgo_project.controller.userpage;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.userpage.RequestSentDTO;  // 클래스 이름 변경
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.service.userpage.RequestSentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class RequestSentController {

    private final RequestSentService requestSentService;

    @GetMapping("/requestsent")
    public String requestSent(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user != null) {
            String userEmail = user.getUser_email();
            List<RequestSentDTO> requests = requestSentService.getRequestsByUserEmail(userEmail);  // 클래스 이름 변경
            model.addAttribute("requests", requests);
            return "userpage/requestsent";  // JSP 파일로 요청 포워딩
        } else {
            return "redirect:/login";  // 로그인 페이지로 리디렉션
        }
    }
}
