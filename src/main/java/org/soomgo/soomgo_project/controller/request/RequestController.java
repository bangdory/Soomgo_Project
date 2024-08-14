package org.soomgo.soomgo_project.controller.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.CategoryDTO;
import org.soomgo.soomgo_project.domain.request.GosuDTO;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.domain.request.TerritoryDTO;
import org.soomgo.soomgo_project.service.request.RequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor // 의존성 주입
@RequestMapping("/request")
public class RequestController {
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



    /*
    @GetMapping("/register")
    @ResponseBody
    public List<TerritoryDTO> categoryListAjax(@RequestParam("id") String territory) {
        return requestService.findTerritory(territory);
    }
*/

/*

    // 견적 등록하는 화면
    @GetMapping("/register")
//    @ResponseBody
    public void register(
            Model model
    ) {
        log.info("register GET 시작");
        List<String> category = requestService.findCategory("개발외주");
        List<String> allStates = requestService.findAllStates();
        log.info(allStates.toString());
//        List<TerritoryDTO> territory = requestService.findTerritory("서울특별시");
        model.addAttribute("c", category);
        model.addAttribute("allStates", allStates);
//        model.addAttribute("t", territory);
    }
*/


    // 카테고리 고르는 화면
    @GetMapping("/category")
    public void categoryList(Model model) {
        List<String> categoryList = requestService.findAllCategory();
        model.addAttribute("list", categoryList);
    }

    // 카테고리 Ajax
    @GetMapping("/category/list")
    @ResponseBody
    public List<CategoryDTO> categoryListAjax(@RequestParam String type) {
        return requestService.findCategory(type);
    }

    // 카테고리 Post 후 Redirect
    @PostMapping("/category")
    public String categorySelect(
            // @RequestParam 은 NAME 속성임!! -> HTML 태그에서 name 값 찾아옴, 오타 주의
            @RequestParam("categorySelect") String sort,
            @RequestParam("categoryName") String type,
            Model model) {
        model.addAttribute("sort", sort);
        model.addAttribute("type", type);
        log.info("타입 전달 : " + sort + ", " + type);
        return "redirect:/request/register";
    }

    // 견적 등록하는 화면
    @GetMapping("/register")
//    @ResponseBody
    public void register(
            @RequestParam("sort") String sort, @RequestParam("type") String type,
            Model model
    ) {
        log.info("register GET 시작");
        model.addAttribute("sort", sort);
        model.addAttribute("type", type);
        List<String> allStates = requestService.findAllStates();
        log.info(allStates.toString());
        model.addAttribute("allStates", allStates);
    }


    @GetMapping("/register/territories")
    @ResponseBody
    public List<TerritoryDTO> getTerritoriesByState(@RequestParam String state) {
        return requestService.findTerritory(state);
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
