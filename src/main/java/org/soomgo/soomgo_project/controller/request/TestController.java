package org.soomgo.soomgo_project.controller.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.service.request.RequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor // 의존성 주입
@RequestMapping("/test")
public class TestController {
    private final RequestService requestService;

    @GetMapping("/list")
    public void listAll(
            @ModelAttribute("dto") RequestDTO dto,
            Model model) {
        model.addAttribute("list", new String[]{"AA", "BB", "CC"});
    }


















/*
    @GetMapping("/basic")
    public void basic() {
        log.info("basic=================");
    }

    @GetMapping("/req")
    public String getReqPage(Model model) {
        log.info("getReqPage");
        return "req";
    }

    @PostMapping("/req")
    public String postReqPage(
            @ModelAttribute RequestDTO requestDTO
    ) {
        log.info(requestDTO.toString());
        requestService.register(requestDTO);
//        rttr.addAttribute("date", date);
        log.info("req_sub : " + requestDTO.getReq_sub());
        return "redirect:/soomgo/test";
    }


    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @GetMapping("/list")
    public void listAll(Model model) {

        log.info("listAll==================");
        List<RequestDTO> requestDTOS = requestService.selectAll();
        model.addAttribute("requestDTOS", requestDTOS);
    }
*/
}
