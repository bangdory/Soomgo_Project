package org.soomgo.soomgo_project.mappers;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class JavaTests {

    @Autowired(required = false)
    TestMapper testMapper;

    @Test
    public void test1() {
        log.info("-------------------------------");
        log.info(testMapper.gettime());
        log.info(testMapper.getClass().getName());
        log.info(testMapper.getTime2());
        log.info("-------------------------------");
    }
}
