package requestSample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.soomgo.soomgo_project.domain.request.*;
import org.soomgo.soomgo_project.mappers.request.RequestMapper;
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
    public void readReceivedRequestByGosuId() {
        GosuDTO gosuDTO = new GosuDTO();
        gosuDTO.setId("고수9");
        gosuDTO.setType("웹개발");
        gosuDTO.setRegion("용산구");
        List<RequestDTO> requestDTOS = requestMapper.readReceivedRequestByGosuId(gosuDTO);
        log.info(requestDTOS);
    }
    @Test
    public void testAnsweredRequestList() {
        GosuDTO gosuDTO = new GosuDTO();
        gosuDTO.setId("고수9");
        gosuDTO.setType("웹개발");
        gosuDTO.setRegion("용산구");
        List<RequestDTO> requestDTOS = requestMapper.answeredRequest(gosuDTO);
        log.info(requestDTOS);
    }

    @Test
    public void findGosu() {
        GosuDTO gosuID = requestMapper.findGosu("고수4");
        log.info(gosuID);
    }

    @Test
    public void findTerritory() {
        List<TerritoryDTO> list = requestMapper.findTerritoryByState("강원특별자치도");
        log.info(list);
    }

    @Test
    public void findCategory() {
        List<CategoryDTO> category = requestMapper.findType("디자인외주");
        log.info(category);
        for (CategoryDTO s : category) {
            log.info(s);
        }
    }

    @Test
    public void findAllCategory() {
        List<String> allCategory = requestMapper.findAllCategory();
        log.info(allCategory);
    }

    @Test
    public void updateRequest() {
        UpdateRequestDTO updateRequestDTO = new UpdateRequestDTO();
        updateRequestDTO.setGosuId("고수2");
        updateRequestDTO.setPrice(5000);
        updateRequestDTO.setReplyRef("어쩌구저쩌구");
        updateRequestDTO.setId(3);
        int update = requestMapper.update(updateRequestDTO);
        log.info(updateRequestDTO);
        log.info(update);
    }

    @Test
    public void testAnswerRequest() {
        AnswerRequestDTO a = new AnswerRequestDTO();
        a.setPrice(50000);
        a.setRef("테스트 서비스를 제공합니다");
        a.setFile("");
        a.setRequestNo(13);
        a.setGosuId("고수4");
//        a.setType("ERP개발");
        requestMapper.answerRequest(a);
        log.info(a);
    }
}
