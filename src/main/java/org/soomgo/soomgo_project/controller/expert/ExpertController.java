package org.soomgo.soomgo_project.controller.expert;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.expert.PageResult;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.soomgo.soomgo_project.service.category.CategoryService;
import org.soomgo.soomgo_project.service.expert.ExpertService;
import org.soomgo.soomgo_project.service.territory.TerritoryService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
@RequestMapping("/expert")
@Log4j2
@RequiredArgsConstructor
public class ExpertController {

    private final CategoryService categoryService;

    private final TerritoryService territoryService;

    private final ExpertService expertService;

    @GetMapping("/expertFind")
    public String expertFind(Model model) {

        int totalPages = 5;
        int currentPage = 1;
        int page = 1;

        List<CategoryDTO> CategoryList = categoryService.getCategoryNotZero();
        List<TerritoryDTO> TerritoryList = territoryService.getTerritory();
        List<ExpertDTO> expertList = expertService.getExpertList();

        model.addAttribute("ExpertList", expertList);
        model.addAttribute("CategoryList", CategoryList);
        model.addAttribute("TerritoryList", TerritoryList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("page", page);

        return "/expert/expertFind";
    }

    @GetMapping("/expertFind/place")
    @ResponseBody
    public List<TerritoryDTO> getTerritoryId(@RequestParam int id) {
        return territoryService.getTerritoryId(id);
    }


    @GetMapping("/expertList/search")
    @ResponseBody
    public PageResult<ExpertDTO> getExpertList(
            @RequestParam(value = "categoryNum", required = false) Integer categoryNum,
            @RequestParam(value = "no", required = false) Integer no,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size) {

        try {
            // 페이징 처리와 함께 데이터 조회

            log.info(expertService.findExperts(categoryNum, no, page, size).toString());

            return expertService.findExperts(categoryNum, no, page, size);



        } catch (Exception e) {
            // 오류 처리
            System.err.println("An error occurred: " + e.getMessage());
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "An error occurred", e);
        }
    }

    @GetMapping("/expertDetail/{expertNum}")
    public String expertDetail(@PathVariable("expertNum") int expertNum, Model model) {
        // 필요한 데이터 모델에 추가

        ExpertDTO expertDTO = expertService.expertDetail(expertNum);

        log.info("ExpertController_expertDetail 메소드 expertDTO : "+expertDTO.toString());

        model.addAttribute("expertDTO", expertDTO);

        return "expert/expertDetail"; // JSP 파일 경로와 일치해야 함
    }
}

