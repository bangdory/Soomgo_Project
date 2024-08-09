package org.soomgo.soomgo_project.controller.category;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.service.category.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/category")
@RequiredArgsConstructor
@Log4j2
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping("/list")
    public String categoryList(Model model) {
        List<CategoryDTO> categoryList = categoryService.getCategoryZero();

        model.addAttribute("list", categoryList);

        List<CategoryDTO> categoryList2 = categoryService.getCategoryId(1);

        model.addAttribute("list2", categoryList2);

        return "category/list";

    }

    @GetMapping("/list/ajax")
    @ResponseBody
    public List<CategoryDTO> categoryListAjax(@RequestParam("id") int id) {
        return categoryService.getCategoryId(id);
    }
}
