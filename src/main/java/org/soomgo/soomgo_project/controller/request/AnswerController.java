package org.soomgo.soomgo_project.controller.request;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;
import org.soomgo.soomgo_project.domain.request.ExpertVO;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.service.request.AnswerService;
import org.soomgo.soomgo_project.service.request.RequestService;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

    @PostMapping("/answer/{id}")
    public String answer(
            HttpSession session,
            @PathVariable(name = "id") int id,
            Model model
    )
//            throws JsonProcessingException
    {

//        ExpertVO expert = (ExpertVO) session.getAttribute("expert");
//        String expert = (String) session.getAttribute("expert");
        ExpertVO expert = (ExpertVO) session.getAttribute("expert");
        RequestDTO request = requestService.getRequest(id);
        model.addAttribute("expert", expert);
        model.addAttribute("request", request);
        log.info("담은 모델" + model);
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
    ) throws JsonProcessingException {

//        String jsonExpert = (String) session.getAttribute("expert");
//        ExpertVO expert = new ObjectMapper().readValue(jsonExpert, ExpertVO.class);

//        ExpertVO expert = (ExpertVO) session.getAttribute("expert");
//        RequestVO received = (RequestVO) session.getAttribute("received");

        ExpertVO expert = (ExpertVO) model.getAttribute("expert");
        model.addAttribute("expert", expert);

        log.info("받은 고수 ----->>>>>" + model);
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
            RedirectAttributes rttr
    ) {
        log.info("업데이트 데이터 : " + answerRequestDTO);
        log.info("고수 id : " + answerRequestDTO.getExpertNum());
        answerService.modify(answerRequestDTO);
        RequestDTO request = requestService.getRequest(answerRequestDTO.getRequestId());
        answerService.answerRequest(answerRequestDTO);
//        rttr.addFlashAttribute("result", request);
//        rttr.addFlashAttribute("id", answerRequestDTO.getId());
        // 인코딩된 URI
        String encodedUri = UriComponentsBuilder.fromPath("{gosuId}")
                .buildAndExpand(answerRequestDTO.getExpertNum())
                .encode()
                .toUriString();
        return "redirect:/request/read/" + encodedUri;
    }

}
