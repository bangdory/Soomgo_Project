package org.soomgo.soomgo_project.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/TestMap")
@Log4j2
public class MapTestController {

    @GetMapping("/testMap")
    public String testMap(){
        log.info("/TestMap/testMap ----------------");

        return "viewTest";
    }

}
