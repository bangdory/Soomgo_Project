package org.soomgo.soomgo_project.controller.userpage;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioDTO;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.soomgo.soomgo_project.domain.user.UserDTO;
import org.soomgo.soomgo_project.domain.user.UserProfileDTO;
import org.soomgo.soomgo_project.service.category.CategoryServiceImpl;
import org.soomgo.soomgo_project.service.territory.TerritoryServiceImpl;
import org.soomgo.soomgo_project.service.userpage.ProfileService;
import org.soomgo.soomgo_project.service.user.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/profile")
public class ProfileController {

    private final ProfileService profileService;
    private final UserService userService;
    private final CategoryServiceImpl categoryServiceImpl;
    private final TerritoryServiceImpl territoryServiceImpl;

    // 프로필 페이지 렌더링
    @GetMapping("")

    public String profile(HttpSession session, Model model) {


        UserDTO user = (UserDTO) session.getAttribute("user");
        UserProfileDTO userprofile = userService.getUserProfileByUserNum(user.getUser_num());

        List<CategoryDTO> category = categoryServiceImpl.getCategoryNotZero();
        List<TerritoryDTO> territory = territoryServiceImpl.getTerritory();

        log.info("territory: " + territory);
        log.info("category: " + category);

            model.addAttribute("territory", territory);
            model.addAttribute("category", category);

        if (user != null) {
            ExpertDTO expertIntro = profileService.getExpertProfile(user.getUser_num());


            List<ExpertPortfolioDTO> expertPortfolios = profileService.getExpertPortfolios(expertIntro.getExpertNum());
            log.info(expertPortfolios);

            model.addAttribute("user", user);
            model.addAttribute("userprofile", userprofile);
            model.addAttribute("expertIntro", expertIntro);

            model.addAttribute("expertPortfolios", expertPortfolios);
            return "user/profile";
        }


        return "redirect:/login"; // 로그인 페이지로 리디렉션
    }

    // 닉네임 및 프로필 정보 업데이트
    @PostMapping("/updateIntro")
    @ResponseBody
    public ResponseEntity<String> updateIntro(
            @RequestParam(value = "newNickname", required = false) String newNickname,
            @RequestParam(value = "newIntro", required = false) String newIntro,
            @RequestParam(value = "newCon_S", required = false) String newCon_S,
            @RequestParam(value = "newCon_E", required = false) String newCon_E,
            @RequestParam(value = "newEmpl", required = false) String newEmpl,
            HttpSession session,Model model
    ) {

        UserDTO user = (UserDTO) session.getAttribute("user");
        UserProfileDTO userprofile = userService.getUserProfileByUserNum(user.getUser_num());

        if (user == null || userprofile == null) {
            return ResponseEntity.status(403).body("사용자 정보가 없습니다.");
        }

        // 사용자 프로필 업데이트
        userprofile.setUser_nickname(newNickname);
        userService.updateUserProfile(userprofile);
        model.addAttribute("userprofile", userprofile);
        log.info("user정보!!!!!!!!!!!" + user.getUser_num());
        // 전문가 정보 업데이트
        ExpertDTO expertIntro = profileService.getExpertProfile(user.getUser_num());
        expertIntro.setIntroduce(newIntro);
        expertIntro.setContact_start(newCon_S);
        expertIntro.setContact_end(newCon_E);
        expertIntro.setEmployees(newEmpl);
        profileService.updateExpertIntro(expertIntro);

        log.info("Updated Intro: {}", expertIntro);

        return ResponseEntity.ok("프로필이 성공적으로 업데이트되었습니다.");
    }

    // 경력 업데이트
    @PostMapping("/updateYears")
    @ResponseBody
    public ResponseEntity<String> updateYears(
            @RequestParam("newYears") int newYears,
            HttpSession session
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return ResponseEntity.status(403).body("사용자 정보가 없습니다.");
        }

        ExpertDTO expertYears = profileService.getExpertProfile(user.getUser_num());
        expertYears.setExperienceYears(newYears);
        profileService.updateExpertYears(expertYears);

        log.info("Updated Years: {}", newYears);

        return ResponseEntity.ok("경력이 성공적으로 업데이트되었습니다.");
    }


    // 포트폴리오 업데이트
    @PostMapping("/createPortfolio")
    @ResponseBody
    public ResponseEntity<String> createPortfolio(
            @RequestParam("newTitle") String newTitle,
            @RequestParam("newThumbnail") MultipartFile thumbnail,
            @RequestParam("newImg") MultipartFile[] images,
            @RequestParam("newTotal_price") int newTotal_price,
            @RequestParam("newWork_year") int newWork_year,
            @RequestParam("newDuration") int newDuration,
            @RequestParam("newDuration_value") String newDuration_value,
            @RequestParam("newDescription") String newDescription,
            HttpSession session, HttpServletRequest request
    ) {
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            return ResponseEntity.status(403).body("사용자 정보가 없습니다.");
        }

        ExpertDTO expert = profileService.getExpertProfile(user.getUser_num());
        if (expert == null) {
            return ResponseEntity.status(404).body("전문가 프로필을 찾을 수 없습니다.");
        }

        ExpertPortfolioDTO expertPortfolio = new ExpertPortfolioDTO();
        expertPortfolio.setTitle(newTitle);
        expertPortfolio.setTotal_price(newTotal_price);
        expertPortfolio.setWork_year(newWork_year);
        expertPortfolio.setDuration(newDuration);
        expertPortfolio.setDuration_value(newDuration_value);
        expertPortfolio.setDescription(newDescription);
        expertPortfolio.setExpert_num(expert.getExpertNum());
        expertPortfolio.setCategory_num(expert.getCategoryNum()); // category_num 설정

        // 썸네일 업로드
        if (!thumbnail.isEmpty()) {
            String uploadDir = request.getServletContext().getRealPath("/resources/static/img");
            try {
                String thumbnailPath = handleFileUpload(thumbnail, uploadDir);
                expertPortfolio.setThumbnail(thumbnailPath);
            } catch (IOException e) {
                return ResponseEntity.status(500).body("썸네일 업로드 실패: " + e.getMessage());
            }
        }

        // 포트폴리오 생성
        int portfolioId;
        try {
            profileService.createExpertPortfolio(expertPortfolio);
            portfolioId = expertPortfolio.getPortfolio_num();
        } catch (Exception e) {
            return ResponseEntity.status(500).body("포트폴리오 생성 실패: " + e.getMessage());
        }

        // 이미지 업로드 처리
        if (images != null && images.length > 0) {
            List<String> imagePaths = new ArrayList<>();

            for (MultipartFile img : images) {
                if (!img.isEmpty()) {
                    try {
                        String imagePath = handleFileUpload(img, request.getServletContext().getRealPath("/resources/static/img"));
                        imagePaths.add(imagePath);

                    } catch (IOException e) {
                        return ResponseEntity.status(500).body("이미지 업로드 실패: " + e.getMessage());
                    }
                }
            }
            // 이미지 추가를 위한 서비스 호출
            try {
                profileService.addPortfolioImages(portfolioId, imagePaths);
            } catch (Exception e) {
                return ResponseEntity.status(500).body("이미지 추가 실패: " + e.getMessage());
            }
        }

        return ResponseEntity.ok("포트폴리오가 성공적으로 생성되었습니다.");
    }

    // 파일 업로드 처리 메소드
    private String handleFileUpload(MultipartFile file, String uploadDir) throws IOException {
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists() && !uploadDirFile.mkdirs()) {
            throw new IOException("디렉토리 생성 실패");
        }

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        String filePath = uploadDir + File.separator + fileName;
        file.transferTo(new File(filePath));

        // DB에 저장할 경로 리턴
        return "/img/" + fileName;
    }


    @GetMapping("/portfolio/{portfolioNum}")
    @ResponseBody
    public ResponseEntity<ExpertPortfolioDTO> getPortfolioDetails(@PathVariable("portfolioNum") int portfolioNum) {
        ExpertPortfolioDTO portfolioDetails = profileService.getPortfolioDetails(portfolioNum);
        if (portfolioDetails != null) {
            return ResponseEntity.ok(portfolioDetails);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
