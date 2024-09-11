package org.soomgo.soomgo_project.controller.category;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.service.category.CategoryService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/category")
@RequiredArgsConstructor
@Log4j2
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping("/list")
    public String categoryList(@RequestParam(value = "num", required = false, defaultValue = "0") Integer num, Model model) {


        log.info("num: " + num);
        List<CategoryDTO> categoryListAll = categoryService.getCategoryAll();
        List<CategoryDTO> categoryList = categoryService.getCategoryZero();
        model.addAttribute("list", categoryList);

        // ID가 1부터 5까지인 항목을 필터링하여 리스트에 저장
        List<CategoryDTO> categoryPidTo0 = categoryListAll.stream()
                .filter(category -> category.getP_Id() == 0)
                .collect(Collectors.toList());
        log.info("categoryPidTo0: " + categoryPidTo0);
        model.addAttribute("categoryPidTo0", categoryPidTo0);


        // ID가 1부터 5까지인 항목을 필터링하여 리스트에 저장
        List<CategoryDTO> categoryId1To5 = categoryListAll.stream()
                .filter(category -> category.getId() >= 1 && category.getId() <= 5 && category.getP_Id() != 0)
                .collect(Collectors.toList());
        log.info("categoryId1To5: " + categoryId1To5);
        model.addAttribute("categoryId1To5", categoryId1To5);

        // ID가 5 이상인 항목을 필터링하여 리스트에 저장
        List<CategoryDTO> categoryOther = categoryListAll.stream()
                .filter(category -> category.getId() > 5)
                .collect(Collectors.toList());
        log.info("categoryOther: " + categoryOther);
        model.addAttribute("categoryOther", categoryOther);

        if (num == 0) {
            List<CategoryDTO> categoryList3 = categoryService.getCategoryNotZero();
            log.info("categoryList3: " + categoryList3);
            model.addAttribute("list3", categoryList3);
        } else {
            List<CategoryDTO> categoryList2 = categoryService.getCategoryId(num);

            model.addAttribute("list2", categoryList2);
        }


        model.addAttribute("num", num);

        return "category/list";

    }

    @GetMapping("/list/ajax")
    @ResponseBody
    public List<CategoryDTO> categoryListAjax(@RequestParam(value = "id", required = false, defaultValue = "0") Integer id) {




        if (id == 0) {
            return categoryService.getCategoryNotZero();
        } else {
            return categoryService.getCategoryId(id);
        }

    }

    @GetMapping("/list/ajax2")
    @ResponseBody
    public Map<String, Object> categoryListAjax2 (@RequestParam(value = "id") Integer id) {

        Map<String, Object> map = new HashMap<>();

        // 대분류 카테고리
        List<CategoryDTO> category = categoryService.getCategoryZero();

        // 소분류 카테고리
        List<CategoryDTO> subCategory = categoryService.getCategoryAll();

        map.put("category", category);
        map.put("subCategory", subCategory);

        return map;

    }

    @GetMapping("/categoryNum")
    @ResponseBody
    public ResponseEntity<Integer> getCategoryNum(@RequestParam("categoryName") String categoryName) {
        try {
            int categoryNum = categoryService.getCategoryByName(categoryName);
            return ResponseEntity.ok(categoryNum);
        } catch (Exception e) {
            log.error(e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
