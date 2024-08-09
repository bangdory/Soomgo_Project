package org.soomgo.soomgo_project.controller.gosu;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.service.category.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/gosu")
@Log4j2
@RequiredArgsConstructor
public class GosuController {

    private final CategoryService categoryService;

    @GetMapping("/gosuFind")
    public void gosu (Model model) {
        List<CategoryDTO> list = categoryService.getCategoryNotZero();
        log.info(list.toString());

        model.addAttribute("list", list);
    }

}
