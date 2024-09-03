package requestSample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.soomgo.soomgo_project.domain.request.*;
import org.soomgo.soomgo_project.domain.userpage.UserProfileDTO;
import org.soomgo.soomgo_project.mappers.request.AnswerMapper;
import org.soomgo.soomgo_project.mappers.request.RequestMapper;
import org.soomgo.soomgo_project.mappers.userpage.UserMapper;
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
    @Autowired(required = false)
    AnswerMapper answerMapper;
    @Autowired(required = false)
    UserMapper userMapper;

    @Test
    public void testMapper() {
        log.info(requestMapper);
    }

    @Test
    public void testInsert() {
        RequestDTO dto = new RequestDTO();
        dto.setUserNum(1);
        dto.setRegDate(LocalDateTime.now());
//        dto.setRef("[\"테스트\", \"제이슨\", \"트발\"]");
        dto.setRef("test");

        int insert = requestMapper.insert(dto);
        log.info("insert 개수 : " + insert);
        log.info("id : " + dto.getId());

    }

    @Test
    public void testSelect() {
        log.info(requestMapper.select(3));
    }

    @Test
    public void testList() {
        List<RequestDTO> list = requestMapper.getListByClientNo(1);
        log.info(list);
    }

    @Test
    public void readReceivedRequestByGosuId() {
        List<RequestVO> requestVOS = requestMapper.readRequestByExpertNum(2);
        log.info(requestVOS);
    }
    @Test
    public void testAnsweredRequestList() {
        List<RequestVO> requestVOS = requestMapper.answeredRequestByExpertNum(1);
        log.info(requestVOS);
    }

    @Test
    public void findExpert() {
//        ExpertDTO expert = requestMapper.findExpert(1);
        UserProfileDTO findExpert = userMapper.findUserProfileByUserNum(1);
//        log.info(expert);
        log.info(findExpert);
    }

    @Test
    public void findExpertVO() {
        ExpertVO expert = requestMapper.findExpert(2);
        log.info(expert);
    }

    @Test
    public void findTerritory() {
        List<TerritoryDTO> list = requestMapper.findTerritoryByState("경기도");
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
    public void selectedType() {
        CategoryDTO selectedType = requestMapper.selectedType("3D모델링");
        log.info(selectedType);
    }

    @Test
    public void updateRequest() {
        AnswerRequestDTO answerRequestDTO = new AnswerRequestDTO();
        answerRequestDTO.setGosuId("고수2");
        answerRequestDTO.setPrice(5000);
        answerRequestDTO.setRef("어쩌구저쩌구");
        answerRequestDTO.setRequestId(10);
        int update = requestMapper.update(answerRequestDTO);
        log.info(answerRequestDTO);
        log.info(update);
    }

    @Test
    public void testAnswerRequest() {
        AnswerRequestDTO a = new AnswerRequestDTO();
        a.setPrice(50000);
        a.setRef("테스트 서비스를 제공합니다");
        a.setFile("");
        a.setRequestId(13);
        a.setGosuId("고수4");
//        a.setType("ERP개발");
        requestMapper.answerRequest(a);
        log.info(a);
    }

    @Test
    public void testAnswerRequestMapper() {
        AnswerRequestDTO a = new AnswerRequestDTO();
        a.setPrice(50000);
        a.setRef("테스트 서비스를 제공합니다");
        a.setFile("");
        a.setRequestId(13);
        a.setGosuId("고수4");
        answerMapper.answerRequest(a);
        log.info(a);
    }

    @Test
    public void readAnswerListTest() {
        List<AnswerRequestDTO> list = answerMapper.answerList(1);
        log.info(list);
    }
}
