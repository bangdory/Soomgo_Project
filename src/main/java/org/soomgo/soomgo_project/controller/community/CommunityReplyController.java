package org.soomgo.soomgo_project.controller.community;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.community.CommunityReplyDTO;
import org.soomgo.soomgo_project.service.community.CommunityReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


@Controller
@RequestMapping("/reply")
@RequiredArgsConstructor
@Log4j2
public class CommunityReplyController {

    private final CommunityReplyService replyService;
    private final ServletContext servletContext;

    @GetMapping("/register")
    public String register(@RequestParam("cb_no") int cb_no, Model model) {
        model.addAttribute("cb_no", cb_no);
        model.addAttribute("reply", new CommunityReplyDTO());
        return "/reply/register";
    }

    private static final String uploadDir = "static/img/community/reply/";

    @PostMapping("/register")
    @ResponseBody
    public Map<String, Object> register(@RequestParam("cb_no") int cb_no,
                                        @RequestParam("cr_content") String cr_content,
                                        @RequestParam(value = "cr_file", required = false) MultipartFile cr_file,
                                        HttpSession session) {

        Integer userNum = (Integer) session.getAttribute("sess_user_num");

        Map<String, Object> response = new HashMap<>();
        String filePath = null;
        CommunityReplyDTO reply = new CommunityReplyDTO();

        reply.setCb_no(cb_no);
        reply.setCr_content(cr_content);
        reply.setUser_num(userNum);

        try {
            replyService.register(reply);

            Map<String, Object> params = new HashMap<>();
            params.put("cb_no", cb_no);
            params.put("user_num", userNum);

            //새로 생성된 댓글의 정보 가져오기
            CommunityReplyDTO newReply = replyService.getReply(params);

            // 파일 저장
            if (cr_file != null && !cr_file.isEmpty()) {
                filePath = saveFile(cb_no, newReply.getCr_no(), cr_file);
            }

            response.put("cr_no", newReply.getCr_no());
            response.put("cr_content", newReply.getCr_content());
            response.put("cr_like", newReply.getCr_like());
            response.put("cr_regdate", newReply.getCr_regdate());
            response.put("user_num", newReply.getUser_num());
            response.put("user_name", newReply.getUser_name());
            response.put("file_path", filePath);

        } catch (IOException e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", e.getMessage());
        }

        return response;
    }

    private String getUploadPath() throws IOException {
        String rootPath = System.getProperty("user.dir");
        return rootPath + File.separator + uploadDir;
    }

    private String saveFile(int cb_no, int cr_no, MultipartFile cr_file) throws IOException {
        if (cr_file != null && !cr_file.isEmpty()) {
            throw new IOException("File is empty");
        }

        // 파일이름 생성
        String uniqueFileName = UUID.randomUUID().toString(); // UUID생성
        String fileName = "communityReply" + cb_no + "_" + cr_no + "_" + uniqueFileName;
        String fileExtension = getFileExtension(cr_file.getOriginalFilename()); // 파일 확장자

//        // 절대경로
//        String uploadDir = servletContext.getRealPath("resources/static/img/community/reply/");


        Path uploadPath = Paths.get(getUploadPath(), fileName + fileExtension);
        Files.createDirectories(uploadPath.getParent()); // 디렉토리가 없으면 생성

        cr_file.transferTo(uploadPath.toFile());

        return uploadPath.toString();
    }

    private String getFileExtension(String fileName) {
        int i = fileName.lastIndexOf(".");
        return i > 0 ? fileName.substring(i) : "";
    }


    @GetMapping("/modify")
    public String modify(@RequestParam("cr_no") int cr_no,
                         Model model, HttpSession session) {

        Integer userNum = (Integer) session.getAttribute("sess_user_num");

        Map<String, Object> params = new HashMap<>();

        params.put("cr_no", cr_no);
        params.put("user_num", userNum);

        model.addAttribute("reply", replyService.getReplyUpdate(params));
        return "reply/modify";
    }

//    @PostMapping("api/modify")
//    @ResponseBody
//    public Map<String, Object> modify(
//            @RequestParam("cr_no") String cr_no,
//            @RequestParam("cr_content") String cr_content,
//            @RequestParam(value = "cr_file", required = false) MultipartFile cr_file) {
//         log.info("PostMapping Modify Reply");
//        log.info("cr_no->" + cr_no);
//        log.info("cr_content->" + cr_content);
//        log.info("cr_file->" + cr_file);
//
//        CommunityReplyDTO reply = new CommunityReplyDTO();
//
//        int intCr_no = Integer.parseInt(cr_no);
//
//        reply.setCr_no(intCr_no);
//        reply.setCr_content(cr_content);
//        reply.setCr_file(cr_file != null ? cr_file.getOriginalFilename() : "");
//
//        replyService.modify(reply);
//
//        Map<String, Object> response = new HashMap<>();
//        response.put("cr_no", reply.getCr_no());
//        response.put("cr_content", reply.getCr_content());
//        response.put("cr_file", reply.getCr_file());
//
//        return response;
//    }

    @PostMapping("/api/modify")
    @ResponseBody
    public Map<String, Object> modify(@RequestBody Map<String, Object> res
) {
        log.info("PostMapping Modify Reply");

        int cr_no = (Integer) res.get("cr_no");
        String cr_content = (String) res.get("cr_content");

        log.info("cr_no->" + res.get("cr_no"));
        log.info("cr_content->" + res.get("cr_content"));
//        log.info("cr_file->" + cr_file);

        CommunityReplyDTO reply = new CommunityReplyDTO();

        reply.setCr_no(cr_no);
        reply.setCr_content(cr_content);
//        reply.setCr_file(cr_file != null ? cr_file.getOriginalFilename() : "");

        replyService.modify(reply);

        Map<String, Object> response = new HashMap<>();
        response.put("cr_no", reply.getCr_no());
        response.put("cr_content", reply.getCr_content());
        response.put("cr_file", reply.getCr_file());
        response.put("success", true);

        return response;
    }

    @PostMapping("delete")
    @ResponseBody
    public ResponseEntity<String> delete(@RequestParam("cr_no") int cr_no) {
        log.info("PostMapping Delete Reply");

        try {
            replyService.delete(cr_no);
            // 200 OK 응답을 반환
            return ResponseEntity.ok("삭제되었습니다.");  // 클라이언트에게 성공 메시지를 전달
        } catch (Exception e) {
            e.printStackTrace();
            // 500 Internal Server Error 응답을 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 실패");
        }
    }
}
