package org.soomgo.soomgo_project.controller.userpage;

import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.domain.userpage.requestDTO;
import org.soomgo.soomgo_project.service.userpage.RequestSentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RequestSentController {

    private final RequestSentService requestSentService;

    @Autowired
    public RequestSentController(RequestSentService requestSentService) {
        this.requestSentService = requestSentService;
    }

    @GetMapping("/requestsent")
    public String requestSent(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user != null) {
            String userEmail = user.getUser_email();
            List<requestDTO> requests = requestSentService.getRequestsByUserEmail(userEmail);
            model.addAttribute("requests", requests);
            return "userpage/requestsent"; // requestsent.jsp로 요청을 포워딩
        } else {
            return "redirect:/login"; // 사용자 미로그인 시 로그인 페이지로 리디렉션
        }
    }
}