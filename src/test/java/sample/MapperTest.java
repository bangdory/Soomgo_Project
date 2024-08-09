package sample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.soomgo.soomgo_project.domain.GosuDTO;
import org.soomgo.soomgo_project.domain.RequestDTO;
import org.soomgo.soomgo_project.domain.RequestList;
import org.soomgo.soomgo_project.mappers.RequestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDateTime;
import java.util.List;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class MapperTest {

    @Autowired(required = false)
    RequestMapper requestMapper;

    @Test
    public void testMapper() {
        log.info(requestMapper);
    }

    @Test
    public void testInsert() {
        RequestDTO dto = new RequestDTO();
        dto.setWriter("1번 writer");
        dto.setRegDate(LocalDateTime.now());
//        dto.setRef("[\"테스트\", \"제이슨\", \"트발\"]");
        dto.setRef("test");

        int insert = requestMapper.insert(dto);
        log.info("insert 개수 : " + insert);
        log.info("id : " + dto.getId());

    }

    @Test
    public void testSelect() {
        int id = 8;
        log.info(requestMapper.select(id));
    }

    @Test
    public void testList() {
        requestMapper.getList().forEach(requestDTO -> log.info(requestDTO));
    }

    @Test
    public void testReadRequest() {
        GosuDTO gosuDTO = new GosuDTO();
        gosuDTO.setId("고수1");
        gosuDTO.setType("type3");
        gosuDTO.setRegion("광주");
        RequestList requestList = requestMapper.readRequest(gosuDTO);
        log.info(requestList.toString());
    }
}
