package org.soomgo.soomgo_project.controller.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.*;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.service.request.AnswerService;
import org.soomgo.soomgo_project.service.request.RequestService;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

//import static com.sun.beans.introspect.PropertyInfo.Name.expert;

@Controller
@Log4j2
@RequiredArgsConstructor // 의존성 주입
@RequestMapping("/request")
public class RequestController {
    private final RequestService requestService;
    private final AnswerService answerService;

    // list
//    @GetMapping("/list/{clientId}")
    @GetMapping("/list")
    public String list(
            HttpSession session,
            Model model // jsp 에 담기 위해!!
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        log.info(user.getUser_num());
        List<RequestVO> list = requestService.list(user.getUser_num());

        log.info(list);
        model.addAttribute("vos", list);
        model.addAttribute("user", user);
        return "/request/list";
    }

    // Ajax 처리로 답변 읽기 -> client 용 list 에서 사용함
    @GetMapping("/answer-list")
    public ResponseEntity<List<AnswerRequestVO>> getAnswerRequestList(@RequestParam int requestId) {
        if (requestId <= 0) {
            return ResponseEntity.badRequest().body(Collections.emptyList());
        }
        List<AnswerRequestVO> answerList = requestService.readAnsweredListOfSelectedRequest(requestId);
        log.info("받은 리스트 -> " + answerList);
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(answerList);
    }

    @GetMapping("/request-detail")
    public ResponseEntity<RequestVO> requestDetail(@RequestParam int requestId) {
        if (requestId <= 0) {
            return ResponseEntity.badRequest().body((RequestVO) Collections.emptyList());
        }
        RequestVO request = requestService.selectedRequest(requestId);
        log.info("상세 요청서 -> " + request);
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(request);
    }

    @GetMapping("/remove-request")
    public ResponseEntity<Boolean> removeRequestByClient(@RequestParam int requestId) {
        if (requestId <= 0) {
            return ResponseEntity.badRequest().body(false);
        }
        log.info("들어온 requestID =>" + requestId);
        boolean deleted = requestService.removeRequestByClient(requestId);
        log.info("삭제된 요청서 -> " + deleted);
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(deleted);
    }

    /*// Ajax 처리로 답변 읽기
    @GetMapping("/answer-list")
    public ResponseEntity<List<AnswerRequestDTO>> getAnswerList(@RequestParam int requestId) {
        if (requestId <= 0) {
            return ResponseEntity.badRequest().body(Collections.emptyList());
        }
        List<AnswerRequestDTO> answerList = answerService.readAnsweredList(requestId);
        log.info("받은 리스트 -> " + answerList);
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(answerList);
    }*/


    /*
    // list
    @GetMapping("/list/{clientId}")
    public String list(
            @PathVariable(name = "clientId") String clientId,
            Model model // jsp 에 담기 위해!!
    ) {
        List<RequestDTO> list = requestService.list(clientId);
//        log.info(list);


//        log.info(list);

        model.addAttribute("lists", list);
        return "/request/list";
    }
    */

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
//        if (job.equals("read")) {
//            return "/request/answer" + id;
//        }
        return "/request/" + job;
    }*/

    //    @GetMapping("/readrequest/{gosuId}")
    @GetMapping("/readrequest")
    // @PathVariable 은 값이 계속 바뀜 -> void 로 리턴할 수 없음
    public String read(
            HttpSession session,
//            @PathVariable(name = "gosuId") String gosuId, // {} 로 묶은 것을 변수로
            Model model
    ) {
        UserDTO expert = (UserDTO) session.getAttribute("user");
        // UserDTO -> ExpertDTO 로 변환시켜서 데이터 뽑아올 것

        if (expert == null) {
            return "redirect:/login";
        } else if (expert.getUser_type() != UserDTO.UserType.EXPERT) {
            return null; // 권한 안내 페이지로 이동시킬 것!!
        }
        ExpertVO expertUser = requestService.findExpert(expert.getUser_num());
//        List<RequestDTO> receivedRequests = requestService.readReceivedRequests(expert);
//        List<RequestDTO> answeredRequests = requestService.readAnsweredRequests(expert);
        List<RequestVO> received = requestService.readReceivedRequests(expertUser);
        List<AnswerRequestVO> answered = requestService.readAnsweredRequests(expertUser);

        log.info("received!!!" + received);
        log.info("answered!!!" + answered);
        session.setAttribute("expert", expertUser);
//        session.setAttribute("received", received);

        model.addAttribute("expert", expertUser);
        model.addAttribute("answeredList", answered);
        model.addAttribute("receivedList", received);

        log.info("답장리스트" + answered);
        log.info("받은리스트" + received);

        return "/request/readrequest";
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
    public String categoryList(
            HttpSession session,
            Model model
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        List<String> categoryList = requestService.findAllCategory();
        if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("list", categoryList);
        }
        return "/request/category";
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
            @RequestParam("categoryName") int categoryNum,
            HttpSession session,
            RedirectAttributes rttr) {
        // sort, type 받아서 category 테이블에서 int 로 변경 해서 넘길 것

        CategoryDTO selectedType = requestService.selectedType(categoryNum);
        log.info("Category선택 !!!!!!!!!!!!!" + selectedType);
        // addAttribute 는 쿼리 파라미터만 처리, flashAttribute 사용
        session.setAttribute("category", selectedType);
        return "redirect:/request/register";
    }
    /*@PostMapping("/category")
    public String categorySelect(
            // @RequestParam 은 NAME 속성임!! -> HTML 태그에서 name 값 찾아옴, 오타 주의
            @RequestParam("categorySelect") String sort,
            @RequestParam("categoryName") String type,
            Model model) {
        // sort, type 받아서 category 테이블에서 int 로 변경 해서 넘길 것
        model.addAttribute("sort", sort);
        model.addAttribute("type", type);
        return "redirect:/request/register";
    }*/

    // 견적 등록하는 화면
    @GetMapping("/register")
//    @ResponseBody
    public String register(
            HttpSession session,
            Model model
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        CategoryDTO category = (CategoryDTO) session.getAttribute("category");
        log.info("Register category!!!!!!!!!!!!!" + category);
        List<String> allStates = requestService.findAllStates();
        model.addAttribute("category", category);
        model.addAttribute("user", user);
        model.addAttribute("allStates", allStates);
        log.info("모델!!!" + model);
        return "/request/register";
    }

    /*@GetMapping("/register")
//    @ResponseBody
    public void register(
            HttpSession session,
            @RequestParam("sort") String sort, @RequestParam("type") String type,
            Model model
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        model.addAttribute("sort", sort);
        model.addAttribute("type", type);
        model.addAttribute("user", user);
        List<String> allStates = requestService.findAllStates();
        model.addAttribute("allStates", allStates);
    }*/


    @GetMapping("/register/territories")
    @ResponseBody
    public List<TerritoryDTO> getTerritoriesByState(@RequestParam String state) {
        return requestService.findTerritory(state);
    }

    // 견적 등록 처리하는 POST + 지역
    @PostMapping("/register")
    public String registerPost(
            @ModelAttribute RequestDTO requestDTO,
            HttpSession session
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        requestDTO.setUserNum(user.getUser_num());
        requestService.register(requestDTO);
//        int register = requestService.register(requestDTO);
//        RequestDTO request = requestService.getRequest(register);
//        rttr.addAttribute("request", request);

//        int userNum = user.getUser_num();
//        String redirectUri = "/request/list/" + userNum;
        /*String encodedUri = UriComponentsBuilder.fromPath("{writer}")
                .buildAndExpand(requestDTO.getWriter())
                .encode()
                .toUriString();
*/
        session.setAttribute("user", user);
        return "redirect:/request/list";
    }
}
