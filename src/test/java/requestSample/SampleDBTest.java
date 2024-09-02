package requestSample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.domain.request.RequestVO;
import org.soomgo.soomgo_project.mappers.request.RequestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class SampleDBTest {
    @Autowired(required = false)
    RequestMapper requestMapper;

    @Test
    public void test() {
        RequestDTO select = requestMapper.select(4);
        log.info("selected Request: ", select);
    }
    @Test
    public void test2() {
        RequestVO requestVO = requestMapper.selectedRequest(3);
        log.info("selected Request: ", requestVO);
    }
}
