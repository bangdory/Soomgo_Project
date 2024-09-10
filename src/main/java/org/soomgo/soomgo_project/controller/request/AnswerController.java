package org.soomgo.soomgo_project.controller.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;
import org.soomgo.soomgo_project.domain.request.AnswerRequestVO;
import org.soomgo.soomgo_project.domain.request.ExpertVO;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.service.request.AnswerService;
import org.soomgo.soomgo_project.service.request.RequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
@RequiredArgsConstructor // 의존성 주입
@RequestMapping("/request")
public class AnswerController {

    private final RequestService requestService;
    private final AnswerService answerService;

    @PostMapping("/answer/{received}")
    public String answer(
            HttpSession session,
            @PathVariable(name = "received") int id,
            Model model
    )
//            throws JsonProcessingException
    {
        log.info("answer Post 에 넘어온 id" + id);
        UserDTO userAsExpert = (UserDTO) session.getAttribute("user");
        // UserDTO -> ExpertDTO 로 변환시켜서 데이터 뽑아올 것

        if (userAsExpert == null) {
            return "redirect:/login";
        } else if (userAsExpert.getUser_type() != UserDTO.UserType.EXPERT) {
            return null; // 권한 안내 페이지로 이동시킬 것!!
        }
        ExpertVO expert = (ExpertVO) session.getAttribute("expert");
        RequestDTO request = requestService.getRequest(id);
        // 위에 이거 requestMapper 에서 selectedRequest 사용하면 RequestVO 로 추출 가능!!
        session.setAttribute("expert", expert);
        session.setAttribute("request", request);
//        log.info("받은 id" + id);
//        log.info("담은 모델" + model);
//        log.info("expert 담은것" + expert);
//        log.info("request 담은것" + request);
//        RequestVO received = (RequestVO) session.getAttribute("received");

//        String jsonExpert = new ObjectMapper().writeValueAsString(expert);

//        session.setAttribute("expert", jsonExpert);
//        session.setAttribute("received", received);

        return "redirect:/request/answerRequest";
    }

    @GetMapping("/answerRequest")
    public String getAnswerRequest(
            HttpSession session,
            Model model
    )
//            throws JsonProcessingException
    {

//        String jsonExpert = (String) session.getAttribute("expert");
//        ExpertVO expert = new ObjectMapper().readValue(jsonExpert, ExpertVO.class);

//        ExpertVO expert = (ExpertVO) session.getAttribute("expert");
//        RequestVO received = (RequestVO) session.getAttribute("received");
        UserDTO userAsExpert = (UserDTO) session.getAttribute("user");
        // UserDTO -> ExpertDTO 로 변환시켜서 데이터 뽑아올 것

        if (userAsExpert == null) {
            return "redirect:/login";
        } else if (userAsExpert.getUser_type() != UserDTO.UserType.EXPERT) {
            return null; // 권한 안내 페이지로 이동시킬 것!!
        }
        RequestDTO request = (RequestDTO) session.getAttribute("request");
        ExpertVO expert = (ExpertVO) session.getAttribute("expert");
        model.addAttribute("request", request);
        model.addAttribute("request", request);
        log.info("컨트롤러에서 받은 request 객체" + request);
        log.info("컨트롤러에서 받은 expert 객체" + expert);

//        log.info("받은 고수 ----->>>>>" + model);
//        log.info("받은 요청서 ----->>>>>" + received);
//        RequestDTO request = requestService.getRequest(id);
//        ExpertVO expert = requestService.findExpert(expertNum);
//        log.info("답장 request id: " + request);
//        log.info("고수 : " + gosu);
//        model.addAttribute("request", request);
//        model.addAttribute("expert", expert);
        return "/request/answerRequest";
    }

/*
    @GetMapping("/answer/{id}")
    public String answer(
            HttpSession session,
            @PathVariable(name = "id") int id,
            @RequestParam(name = "expertNum") int expertNum,
            Model model
    ) {
        RequestDTO request = requestService.getRequest(id);
        ExpertVO expert = requestService.findExpert(expertNum);
//        log.info("답장 request id: " + request);
//        log.info("고수 : " + gosu);
        model.addAttribute("request", request);
        model.addAttribute("expert", expert);
        return "/request/answer";
    }
*/


    @PostMapping("/answerRequest")
    public String PostAnswer(
            @ModelAttribute AnswerRequestDTO answerRequestDTO,
            HttpSession session,
            RedirectAttributes rttr
    ) {
        UserDTO userAsExpert = (UserDTO) session.getAttribute("user");
        // UserDTO -> ExpertDTO 로 변환시켜서 데이터 뽑아올 것

        if (userAsExpert == null) {
            return "redirect:/login";
        } else if (userAsExpert.getUser_type() != UserDTO.UserType.EXPERT) {
            return null; // 권한 안내 페이지로 이동시킬 것!!
        }
        log.info("업데이트 데이터 : " + answerRequestDTO);
        log.info("고수 id : " + answerRequestDTO.getExpertNum());
        log.info("요청서 id : " + answerRequestDTO.getRequestId());
        answerService.modifyOriginalRequest(answerRequestDTO);
        RequestDTO request = requestService.getRequest(answerRequestDTO.getRequestId());
        answerService.answerRequest(answerRequestDTO);
//        rttr.addFlashAttribute("result", request);
//        rttr.addFlashAttribute("id", answerRequestDTO.getId());
        // 인코딩된 URI
        String encodedUri = UriComponentsBuilder.fromPath("{expertNum}")
                .buildAndExpand(answerRequestDTO.getExpertNum())
                .encode()
                .toUriString();
//        return "redirect:/request/read/" + encodedUri;
        return "redirect:/request/readrequest";
    }

    @PostMapping("/ignoreAnswerRequest/{idToIgnore}")
    public String removeAnsweredRequestByExpert(
            @RequestParam(name = "idToIgnore") int id,
            HttpSession session
    ) {
        log.info("들어온 requestID =>" + id);
        UserDTO userAsExpert = (UserDTO) session.getAttribute("user");
        // UserDTO -> ExpertDTO 로 변환시켜서 데이터 뽑아올 것

        if (userAsExpert == null) {
            return "redirect:/login";
        } else if (userAsExpert.getUser_type() != UserDTO.UserType.EXPERT) {
            return null; // 권한 안내 페이지로 이동시킬 것!!
        }/*else if (id <= 0) {
            return null; // 에러 페이지로 띄울 것!!
        }*/
        AnswerRequestVO selectedAnswerRequest = answerService.findAnswerRequestVOById(id);
        answerService.ignoreAnswerRequestByExpert(selectedAnswerRequest);

        return "redirect:/request/readrequest";
    }
/*

    @PostMapping("/ignoreReceivedRequest/{idToIgnore}")
    public String removeReceivedRequestByExpert(
            @RequestParam(name = "idToIgnore") int id,
            HttpSession session
    ) {
        log.info("들어온 requestID =>" + id);
        UserDTO userAsExpert = (UserDTO) session.getAttribute("user");
        ExpertVO expert = requestService.findExpert(userAsExpert.getUser_num());

        if (userAsExpert == null) {
            return "redirect:/login";
        } else if (userAsExpert.getUser_type() != UserDTO.UserType.EXPERT) {
            return null; // 권한 안내 페이지로 이동시킬 것!!
        }*/
/*else if (id <= 0) {
            return null; // 에러 페이지로 띄울 것!!
        }*//*

        answerService.ignoreReceivedRequestByExpert(id,expert.getExpertNum());

        return "redirect:/request/readrequest";
    }
*/

}
