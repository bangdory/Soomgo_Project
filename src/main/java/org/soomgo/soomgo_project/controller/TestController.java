package org.soomgo.soomgo_project.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/sample")
public class TestController {

    @GetMapping("/basic")
    public void basic() {
        log.info("basic -------------------------");
    }

}
