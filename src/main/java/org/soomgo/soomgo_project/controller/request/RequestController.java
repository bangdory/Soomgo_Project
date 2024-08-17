package org.soomgo.soomgo_project.controller.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.*;
import org.soomgo.soomgo_project.service.request.RequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

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
//        log.info("list==========");

        List<RequestDTO> list = requestService.list();
//        log.info(list);

        model.addAttribute("list", list);
    }

    // 견적 read, modify
    /*@GetMapping("/{job}/{id}")
    // @PathVariable 은 값이 계속 바뀜 -> void 로 리턴할 수 없음
    public String read(
            @PathVariable(name = "job") String job,
            @PathVariable(name = "id") String id, // {} 로 묶은 것을 변수로
            Model model
    ) {
        if (!(job.equals("read") || job.equals("answer"))) {
            throw new RuntimeException("Bad Request Job");
        }
        GosuDTO gosu = requestService.findGosu(id);
        List<RequestDTO> requestDTOS = requestService.readRequest(gosu);
        model.addAttribute("gosu", gosu);
        model.addAttribute("lists", requestDTOS);
        return "/request/" + job;
    }*/

    @GetMapping("/read/{gosuId}")
    // @PathVariable 은 값이 계속 바뀜 -> void 로 리턴할 수 없음
    public String read(
            @PathVariable(name = "gosuId") String gosuId, // {} 로 묶은 것을 변수로
            Model model
    ) {
        log.info("gosuId read : " + gosuId);
        GosuDTO gosu = requestService.findGosu(gosuId);
        log.info("gosuDTO read : " + gosu);
        List<RequestDTO> receivedRequests = requestService.readReceivedRequests(gosu);
        List<RequestDTO> answeredRequests = requestService.readAnsweredRequests(gosu);

        log.info("answered 찾은 값: {}", answeredRequests);
        model.addAttribute("gosu", gosu);
        model.addAttribute("answered", answeredRequests);
        model.addAttribute("received", receivedRequests);
        return "/request/read";
    }
/*

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
            @ModelAttribute UpdateRequestDTO updateRequestDTO,
            RedirectAttributes rttr
    ) {
        log.info("업데이트 데이터 : " + updateRequestDTO);
        log.info("고수 id : " + updateRequestDTO.getGosuId());
        requestService.modify(updateRequestDTO);
        RequestDTO request = requestService.getRequest(updateRequestDTO.getId());
        rttr.addFlashAttribute("result", request);
//        rttr.addFlashAttribute("id", updateRequestDTO.getId());
        // 인코딩된 URI
        String encodedUri = UriComponentsBuilder.fromPath("{gosuId}")
                .buildAndExpand(updateRequestDTO.getGosuId())
                .encode()
                .toUriString();
        return "redirect:/request/read/"+ encodedUri;
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
//        log.info("타입 전달 : " + sort + ", " + type);
        return "redirect:/request/register";
    }

    // 견적 등록하는 화면
    @GetMapping("/register")
//    @ResponseBody
    public void register(
            @RequestParam("sort") String sort, @RequestParam("type") String type,
            Model model
    ) {
//        log.info("register GET 시작");
        model.addAttribute("sort", sort);
        model.addAttribute("type", type);
        List<String> allStates = requestService.findAllStates();
//        log.info(allStates.toString());
        model.addAttribute("allStates", allStates);
    }


    @GetMapping("/register/territories")
    @ResponseBody
    public List<TerritoryDTO> getTerritoriesByState(@RequestParam String state) {
        return requestService.findTerritory(state);
    }

    // 견적 등록 처리하는 POST + 지역
    @PostMapping("/register")
    public String registerPost(
            RequestDTO requestDTO,
            RedirectAttributes rttr
    ) {
        rttr.addFlashAttribute("dto", requestDTO);
//        log.info("requestDTO : " + requestDTO);
        requestService.register(requestDTO);
        return "redirect:/request/list";
    }
}
