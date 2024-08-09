package sample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.soomgo.soomgo_project.domain.RequestDTO;
import org.soomgo.soomgo_project.mappers.RequestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class SampleDBTest {
    @Autowired (required = false)
    RequestMapper requestMapper;
    @Test
    public void test() {
        log.info("===================================");
        log.info("RequestMapper: {}", requestMapper);
        log.info("===================================");

        RequestDTO requestDTO = requestMapper.select(1);
        log.info("===================================");
        log.info("RequestVO: {}", requestDTO);
        log.info("===================================");
    }
}
