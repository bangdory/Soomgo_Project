package org.soomgo.soomgo_project.controller.community;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.community.CommunityReplyDTO;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;
import org.soomgo.soomgo_project.domain.community.CommunityReplyDTO;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
import org.soomgo.soomgo_project.service.category.CategoryService;
import org.soomgo.soomgo_project.service.community.CommunityBoardService;
import org.soomgo.soomgo_project.service.community.CommunityBoardServiceImpl;
import org.soomgo.soomgo_project.service.community.CommunityReplyService;
import org.soomgo.soomgo_project.service.territory.TerritoryService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/community")
@RequiredArgsConstructor
@Log4j2
public class CommunityBoardController {

    private final CommunityBoardService communityBoardService;
    private final CategoryService categoryService; // 카테고리 서비스
    private final TerritoryService territoryService; // 지역 서비스 -> register.jsp 에서 훔쳐온 모달 사용할려고
    private final CommunityBoardServiceImpl service;
    private final ServletContext servletContext;
    private final CommunityReplyService replyService;

    /*
    @Autowired
    public CommunityBoardController(CommunityBoardService communityBoardService,
                                    CategoryService categoryService,
                                    TerritoryService territoryService,
                                    CommunityBoardServiceImpl service,
                                    HttpServletResponse httpServletResponse,
                                    ServletContext servletContext) {
        this.communityBoardService = communityBoardService;
        this.categoryService = categoryService;
        this.territoryService = territoryService;
        this.service = service;
        this.httpServletResponse = httpServletResponse;
        this.servletContext = servletContext;
    }
*/
    @GetMapping("/register")
    public void register(Model model) {
        log.info("GetMapping register");

        List<CategoryDTO> categories = categoryService.getCategoryNotZero();
        List<TerritoryDTO> territories = territoryService.getTerritory();

        model.addAttribute("CategoryList", categories);
        model.addAttribute("TerritoryList", territories);
        model.addAttribute("board", new CommunityBoardDTO());
    }

    private static final String uploadDir = "/resources/static/img/community/";

    @PostMapping("/register")
    public String register(@RequestParam("cb_title") String title,
                           @RequestParam("cb_content") String content,
                           @RequestParam("board_no") int board_no,
                           @RequestParam(value = "cb_file", required = false) MultipartFile file,
                           @RequestParam("categoryNum") int categoryNum,
                           @RequestParam("cb_addr") int cb_addr,
                           HttpSession session,
                           RedirectAttributes rttr) {
        log.info("PostMapping register");
        log.info("categoryNum: " + categoryNum);


        String filePath = null;
        try {
            if (file != null && !file.isEmpty()) {
                filePath = saveFile(board_no, title, file);
            }
        } catch (IOException e) {
            e.printStackTrace();
            rttr.addFlashAttribute("message", "Error uploading file");
            return "redirect:/community/register";
        }

//        로그인 세션에서 user_num 받아와서 user_num 에 저장하기
        Integer userNum = (Integer) session.getAttribute("sess_user_num");
        if (userNum == null) {
            return "redirect:/user/login";
        }


        CommunityBoardDTO board = new CommunityBoardDTO();
        board.setCb_title(title);
        board.setCb_content(content);
        board.setBoard_no(board_no);
        board.setCb_file(filePath != null ? filePath : "");
        board.setCategoryNum(categoryNum);
        board.setCb_addr(cb_addr);
        board.setUser_num(userNum);
        log.info("생성된 객체 : " + board);
        service.register(board);

        return "redirect:/community/listAll?board_no=" + board_no;
    }

    @GetMapping("/register/place")
    @ResponseBody
    public List<TerritoryDTO> getPlaceData(@RequestParam("id") int id) {
        List<TerritoryDTO> territories = territoryService.getTerritoryId(id);
        return territories;  // JSON 형식으로 반환
    }

    private String getUploadPath() {
        String rootPath = System.getProperty("user.dir");
        return rootPath + uploadDir;
    }

    private String saveFile(int board_no, String title, MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new IOException("File is empty");
        }

        // 파일이름 생성
        String encodingTitle = encodeFileName(title);
        String uniqueFileName = UUID.randomUUID().toString(); // UUID 생성
        String fileName = "community" + board_no + "-" + encodingTitle + "-" + uniqueFileName;
        String fileExtension = getFileExtension(file.getOriginalFilename()); // 파일확장자
//        Path path = Paths.get(uploadDir, fileName+fileExtension);

//      절대경로
        String uploadDir = servletContext.getRealPath("/resources/static/img/community");
        Path path = Paths.get(getUploadPath(), fileName + fileExtension);
        log.info("path: " + path);


        Files.createDirectories(path.getParent());

        file.transferTo(path.toFile());

        return uploadDir + fileName + fileExtension;
    }

    private String encodeFileName(String fileName) throws UnsupportedEncodingException {
        // URL 인코딩하여 파일 이름 안전하게 변환
        return URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
    }

    private String getFileExtension(String fileName) {
        int i = fileName.lastIndexOf('.');
        return i > 0 ? fileName.substring(i) : "";
    }

    @GetMapping("/categoryNum")
    @ResponseBody
    public ResponseEntity<Integer> getCategoryNum(@RequestParam("categoryName") String categoryName) {
        int categoryNum = categoryService.getCategoryByName(categoryName);
        return ResponseEntity.ok(categoryNum);
    }


    @GetMapping("/read")
    public String read(@RequestParam("cb_no") int cb_no, Model model, HttpSession session) {

        System.out.println("cb_no 받아왔나요? " + cb_no);

        //        로그인 세션에서 user_num 받아와서 user_num 에 저장하기
        Integer userNum = (Integer) session.getAttribute("sess_user_num");
        log.info("userNum: " + userNum);


        // 조회수
        communityBoardService.lookAtThis(cb_no);

        Map<String, Object> params = new HashMap<>();
        params.put("cb_no", cb_no);
        if (userNum != null) {
            params.put("user_num", userNum);
        }

        System.out.println("Params: " + params);

        CommunityBoardDTO board = communityBoardService.read(cb_no);
        log.info("board : " + board.toString());
        if (board != null) {
            model.addAttribute("board", board);
            model.addAttribute("cb_regdate", board.getCb_regdate());
            model.addAttribute("cb_view", board.getCb_view());

            if (userNum != null) {
                boolean isLiked = communityBoardService.isLiked(params);
                model.addAttribute("isLiked", isLiked);
            } else {
                model.addAttribute("isLiked", false);
            }
        } else {
            model.addAttribute("error", "게시글을 찾을 수 없습니다.");
        }

        // 댓글목록
        List<CommunityReplyDTO> replies = replyService.read(cb_no);
        log.info("replies : " + replies.toString());
        model.addAttribute("replies", replies);

        return "community/read";

    }

    @PostMapping("/increaseLike")
    @ResponseBody
    public Map<String, Object> increaseLike(@RequestParam("cb_no") int cb_no,
                                            HttpSession session) {

        Map<String, Object> response = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        params.put("cb_no", cb_no);

        Integer userNum = (Integer) session.getAttribute("sess_user_num");
        if (userNum == null) {
            throw new IllegalStateException("로그인이 필요합니다.");
        } else {
            params.put("user_num", userNum);
        }

        log.info("user_num: " + userNum);
        log.info("cb_no: " + cb_no);

        service.increaseLike(params);

        int newLikeCount = service.getLikeCount(cb_no);
        response.put("newLikeCount", newLikeCount);
        return response;
    }

    @DeleteMapping("/removeLike")
    @ResponseBody
    public Map<String, Object> removeLike(@RequestParam("cb_no") int cb_no, HttpSession session) {

        Integer userNum = (Integer) session.getAttribute("sess_user_num");

        Map<String, Object> params = new HashMap<>();
        params.put("cb_no", cb_no);

        if (userNum == null) {
            throw new IllegalStateException("로그인이 필요합니다.");
        }
        params.put("user_num", userNum);

        log.info("user_num: " + userNum);
        log.info("cb_no: " + cb_no);

        service.removeLike(params);

        int newLikeCount = service.getLikeCount(cb_no);
        Map<String, Object> response = new HashMap<>();
        response.put("newLikeCount", newLikeCount);
        return response;
    }

    @GetMapping("/listAll")
    public String listAll(@RequestParam(value = "board_no", defaultValue = "0") int board_no, Model model) {

        if (board_no != 0) {
            List<CategoryDTO> CategoryList = categoryService.getCategoryNotZero();
            List<TerritoryDTO> TerritoryList = territoryService.getTerritory();
            List<CommunityBoardDTO> boards = communityBoardService.listByBoardNo(board_no);

            model.addAttribute("boards", boards);
            model.addAttribute("board_no", board_no);
            model.addAttribute("CategoryList", CategoryList);
            model.addAttribute("TerritoryList", TerritoryList);

            return "community/listAll";
        } else {
            List<CategoryDTO> CategoryList = categoryService.getCategoryNotZero();
            List<TerritoryDTO> TerritoryList = territoryService.getTerritory();
            List<CommunityBoardDTO> boards = communityBoardService.listAll();

            model.addAttribute("boards", boards);
            model.addAttribute("board_no", board_no);
            model.addAttribute("CategoryList", CategoryList);
            model.addAttribute("TerritoryList", TerritoryList);

            return "community/listAll";
        }

    }

    @GetMapping("/communitySearch")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> filterList(@RequestParam(value = "board_no", defaultValue = "0") int board_no,
                                                          @RequestParam(value = "categoryNum", required = false) Integer categoryNum,
                                                          @RequestParam(value = "no", required = false) Integer no) {

        log.info("no: " + no);

        List<CategoryDTO> CategoryList = categoryService.getCategoryNotZero();
        List<TerritoryDTO> TerritoryList = territoryService.getTerritory();

        log.info("board_no" + board_no);
        log.info("categoryNum" + categoryNum);
        log.info("no" + no);
        log.info("TerritoryList" + TerritoryList);

        Map<String, Object> params = new HashMap<>();
        params.put("board_no", board_no);
        params.put("categoryNum", categoryNum);
        params.put("cb_addr", no);

        List<CommunityBoardDTO> boards = communityBoardService.communitySearch(params);

        log.info("boards!!!!" + boards);

        Map<String, Object> response = new HashMap<>();
        response.put("boards", boards);
        response.put("board_no", board_no);
        response.put("CategoryList", CategoryList);
        response.put("TerritoryList", TerritoryList);
        response.put("categoryNum", categoryNum);
        response.put("no", no);


        return ResponseEntity.ok(response);


    }


    @GetMapping("/listAll/place")
    @ResponseBody
    public List<TerritoryDTO> getTerritoryId(@RequestParam int id) {
        return territoryService.getTerritoryId(id);
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("cb_no") int cb_no, RedirectAttributes rttr) {
        communityBoardService.delete(cb_no);
        return "redirect:/community/listAll";
    }

    @GetMapping("/modify")
    public String update(@RequestParam("cb_no") int cb_no, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("cb_no", cb_no);

        List<CategoryDTO> categories = categoryService.getCategoryNotZero();
        List<TerritoryDTO> territories = territoryService.getTerritory();

        model.addAttribute("CategoryList", categories);
        model.addAttribute("TerritoryList", territories);
        model.addAttribute("board", communityBoardService.read(cb_no));
        return "community/modify";
    }

    @PostMapping("/modify")
    public String update(@RequestParam("cb_no") int cb_no,
                         @RequestParam("cb_title") String title,
                         @RequestParam("cb_content") String content,
                         @RequestParam("board_no") int board_no,
                         @RequestParam(value = "cb_file", required = false) MultipartFile file,
                         @RequestParam("categoryNum") int categoryNum,
                         @RequestParam("cb_addr") int cb_addr,
                         HttpSession session,
                         RedirectAttributes rttr) {
        // 현재 게시글
        Map<String, Object> params = new HashMap<>();
        params.put("cb_no", cb_no);

        CommunityBoardDTO board = communityBoardService.read(cb_no);

        //        로그인 세션에서 user_num 받아와서 user_num 에 저장하기
        Integer userNum = (Integer) session.getAttribute("sess_user_num");
        if (userNum == null) {
            return "redirect:/user/login";
        }

//        log.info("userNum: ", userNum);

        // 파일업로드
        String filePath = null;
        try {
            if (file != null && !file.isEmpty()) {
                filePath = saveFile(board_no, title, file);
            }
        } catch (IOException e) {
            e.printStackTrace();
            rttr.addFlashAttribute("message", "Error uploading file");
            return "redirect:/community/modify?cb_no=" + cb_no;
        }

        board.setCb_title(title);
        board.setCb_content(content);
        board.setBoard_no(board_no);
        board.setCb_file(filePath != null ? filePath : board.getCb_file());
        board.setCategoryNum(categoryNum);
        board.setCb_addr(cb_addr);
        board.setUser_num(userNum);

        communityBoardService.update(board);
        return "redirect:/community/read?cb_no=" + board.getCb_no();
    }

    @GetMapping("/ajax/boardPosts")
    @ResponseBody
    public List<CommunityBoardDTO> getBoardPosts(@RequestParam("board_no") int board_no,
                                                 @RequestParam(value = "service", required = false) String service,
                                                 @RequestParam(value = "place", required = false) String place) {
        return communityBoardService.listByBoardNo(board_no);
    }

    @GetMapping("/user/isLoggedIn")
    public ResponseEntity<Map<String, Object>> isLoggedIn(HttpSession session) {
        boolean loggedIn = session.getAttribute("sess_user_num") != null;
        Map<String, Object> response = new HashMap<>();
        response.put("loggedIn", loggedIn);
        return ResponseEntity.ok(response);
    }


}
