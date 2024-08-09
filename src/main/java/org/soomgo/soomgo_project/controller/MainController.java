package org.soomgo.soomgo_project.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.CategoryDTO;
import org.soomgo.soomgo_project.domain.GosuDTO;
import org.soomgo.soomgo_project.domain.RequestDTO;
import org.soomgo.soomgo_project.domain.TerritoryDTO;
import org.soomgo.soomgo_project.service.RequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor // 의존성 주입
@RequestMapping("/request")
public class MainController {
    private final RequestService requestService;

    // list
    @GetMapping("/list")
    public void list(
            Model model // jsp 에 담기 위해!!
    ) {
        log.info("list==========");

        List<RequestDTO> list = requestService.list();
        log.info(list);

        model.addAttribute("list", list);
    }

    // 견적 read
    @GetMapping("/read/{id}")
    // @PathVariable 은 값이 계속 바뀜 -> void 로 리턴할 수 없음
    public String read(
            @PathVariable(name = "id") String id, // {} 로 묶은 것을 변수로
            Model model
    ) {
        GosuDTO gosu = requestService.findGosu(id);
        List<RequestDTO> requestDTOS = requestService.readRequest(gosu);
        model.addAttribute("gosu", gosu);
        model.addAttribute("lists", requestDTOS);
        return "/request/read";
    }

    // 견적 등록하는 화면
    @GetMapping("/register/")
    public void register(
            Model model
    ) {
        List<String> category = requestService.findCategory("디자인외주");
        model.addAttribute("c", category);
    }

    /*

        // 견적 등록 처리하는 POST
        @PostMapping("/register")
        // Redirection 용 String!!
        public String registerPost(
                RequestDTO requestDTO,
                RedirectAttributes rttr
        ) {
            log.info("requestDTO : " + requestDTO);
            int id = requestService.register(requestDTO);
            rttr.addFlashAttribute("result", id);
            // 몇번 견적서가 등록되었는지 -> result 라는 이름, id 번 견적서
            rttr.addFlashAttribute("dto", requestDTO);
            log.info("requestDTO : " + requestDTO);
            return "redirect:/request/list";
        }
    */

    // 견적 등록 처리하는 POST + 지역
    @PostMapping("/register")
    public String registerPost(
            RequestDTO requestDTO,
            RedirectAttributes rttr
    ) {
        rttr.addFlashAttribute("dto", requestDTO);
        log.info("requestDTO : " + requestDTO);
        requestService.register(requestDTO);
        return "redirect:/request/list";
    }
/*
    @GetMapping("/{job}/{id}")
    public String read2(
            @PathVariable(name = "job") String job,
            @PathVariable(name = "id") int id,
            Model model) {
        log.info("job : " + job);
        log.info("id : " + id);

        if(!(job.equals("read") || job.equals("modify))){
            throw new RuntimeException("Bad Request job");
        }
        RequestDTO requestDTO = requestService.get(id);
        log.info("requestDTO : " + requestDTO);
        model.addAttribute("dto", requestDTO);
        return "/request/read";
    }
*/
}
