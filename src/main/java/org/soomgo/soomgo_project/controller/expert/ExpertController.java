package org.soomgo.soomgo_project.controller.expert;

import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.service.gosu.ExpertServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/expert")
@Log4j2
public class ExpertController {

    private final ExpertServiceImpl expertService;

    @Autowired
    public ExpertController(ExpertServiceImpl expertService) {
        this.expertService = expertService;
    }

    @GetMapping("/list")
    public String getExpertList(Model model) {
        log.info("getExpertList() 실행 중 ......");

        List<ExpertDTO> expertList = expertService.getExpertList();
        log.info(expertList.toString());

        model.addAttribute("expertList", expertList);

        return "expert/list";
    }

}
