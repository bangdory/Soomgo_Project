package org.soomgo.soomgo_project.controller.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;
import org.soomgo.soomgo_project.domain.request.GosuDTO;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.service.request.AnswerService;
import org.soomgo.soomgo_project.service.request.RequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@Log4j2
@RequiredArgsConstructor // 의존성 주입
@RequestMapping("/request")
public class AnswerController {

    private final RequestService requestService;
    private final AnswerService answerService;

    @GetMapping("/answer/{id}")
    public String answer(
            @PathVariable(name = "id") int id,
            @RequestParam(name = "gosuId") String gosuId,
            Model model
    ) {
        RequestDTO request = requestService.getRequest(id);
        GosuDTO gosu = requestService.findGosu(gosuId);
//        log.info("답장 request id: " + request);
//        log.info("고수 : " + gosu);
        model.addAttribute("request", request);
        model.addAttribute("gosu", gosu);
        return "/request/answer";
    }

    @PostMapping("/answer")
    public String answerPost(
            @ModelAttribute AnswerRequestDTO answerRequestDTO,
            RedirectAttributes rttr
    ) {
        log.info("업데이트 데이터 : " + answerRequestDTO);
        log.info("고수 id : " + answerRequestDTO.getGosuId());
        answerService.modify(answerRequestDTO);
        RequestDTO request = requestService.getRequest(answerRequestDTO.getRequestId());
        answerService.answerRequest(answerRequestDTO);
        rttr.addFlashAttribute("result", request);
//        rttr.addFlashAttribute("id", answerRequestDTO.getId());
        // 인코딩된 URI
        String encodedUri = UriComponentsBuilder.fromPath("{gosuId}")
                .buildAndExpand(answerRequestDTO.getGosuId())
                .encode()
                .toUriString();
        return "redirect:/request/read/"+ encodedUri;
    }

}
