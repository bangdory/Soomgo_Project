package org.soomgo.soomgo_project.controller.request;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;
import org.soomgo.soomgo_project.domain.request.ExpertVO;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.domain.request.RequestVO;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.service.request.AnswerService;
import org.soomgo.soomgo_project.service.request.RequestService;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor // 의존성 주입
@RequestMapping("/request")
public class AnswerController {

    private final RequestService requestService;
    private final AnswerService answerService;

    @PostMapping("/answer")
    public String answer(
            HttpSession session
    ) throws JsonProcessingException {

//        ExpertVO expert = (ExpertVO) session.getAttribute("expert");
        String expert = (String) session.getAttribute("expert");
//        RequestVO received = (RequestVO) session.getAttribute("received");

        String jsonExpert = new ObjectMapper().writeValueAsString(expert);

        session.setAttribute("expert", jsonExpert);
//        session.setAttribute("received", received);

        return "redirect:/request/answerRequest";
    }

    @GetMapping("/answerRequest")
    public String getAnswerRequest(
            HttpSession session,
            Model model
    ) throws JsonProcessingException {

        String jsonExpert = (String) session.getAttribute("expert");
        ExpertVO expert = new ObjectMapper().readValue(jsonExpert, ExpertVO.class);

//        ExpertVO expert = (ExpertVO) session.getAttribute("expert");
//        RequestVO received = (RequestVO) session.getAttribute("received");

        log.info("받은 고수 ----->>>>>" + expert);
//        log.info("받은 요청서 ----->>>>>" + received);
//        RequestDTO request = requestService.getRequest(id);
//        ExpertVO expert = requestService.findExpert(expertNum);
//        log.info("답장 request id: " + request);
//        log.info("고수 : " + gosu);
//        model.addAttribute("request", request);
        model.addAttribute("expert", expert);
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
/*
    // 0903 주석처리 -> answerController 작업중
    // Ajax 처리로 답변 읽기
    @GetMapping("/answer-list")
    public ResponseEntity<List<AnswerRequestDTO>> getAnswerRequestList(@RequestParam int requestId) {
        if (requestId <= 0) {
            return ResponseEntity.badRequest().body(Collections.emptyList());
        }
        List<AnswerRequestDTO> answerList = answerService.readAnsweredList(requestId);
        log.info("받은 리스트 -> " + answerList);
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(answerList);
    }
*/

    @PostMapping("/answerRequest")
    public String PostAnswer(
            @ModelAttribute AnswerRequestDTO answerRequestDTO,
            RedirectAttributes rttr
    ) {
        log.info("업데이트 데이터 : " + answerRequestDTO);
        log.info("고수 id : " + answerRequestDTO.getGosuId());
        answerService.modify(answerRequestDTO);
        RequestDTO request = requestService.getRequest(answerRequestDTO.getRequestId());
        answerService.answerRequest(answerRequestDTO);
//        rttr.addFlashAttribute("result", request);
//        rttr.addFlashAttribute("id", answerRequestDTO.getId());
        // 인코딩된 URI
        String encodedUri = UriComponentsBuilder.fromPath("{gosuId}")
                .buildAndExpand(answerRequestDTO.getGosuId())
                .encode()
                .toUriString();
        return "redirect:/request/read/" + encodedUri;
    }

}
