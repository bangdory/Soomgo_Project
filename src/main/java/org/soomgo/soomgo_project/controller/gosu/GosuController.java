package org.soomgo.soomgo_project.controller.gosu;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.soomgo.soomgo_project.service.category.CategoryService;
import org.soomgo.soomgo_project.service.territory.TerritoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/gosu")
@Log4j2
@RequiredArgsConstructor
public class GosuController {

    private final CategoryService categoryService;

    private final TerritoryService territoryService;

    @GetMapping("/gosuFind")
    public void gosu (Model model) {
        List<CategoryDTO> CategoryList = categoryService.getCategoryNotZero();
        log.info(CategoryList.toString());

        List<TerritoryDTO> TerritoryList = territoryService.getTerritory();
        log.info(TerritoryList.toString());

        model.addAttribute("CategoryList", CategoryList);
        model.addAttribute("TerritoryList", TerritoryList);
    }

    @GetMapping("/gosuFind/place")
    @ResponseBody
    public List<TerritoryDTO> getTerritoryId(@RequestParam int id) {
        return territoryService.getTerritoryId(id);
    }

}
