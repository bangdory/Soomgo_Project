package requestSample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.soomgo.soomgo_project.domain.expert.ExpertPortfolioDTO;
import org.soomgo.soomgo_project.domain.request.CategoryDTO;
import org.soomgo.soomgo_project.domain.request.GosuDTO;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.domain.request.TerritoryDTO;
import org.soomgo.soomgo_project.mappers.request.RequestMapper;
import org.soomgo.soomgo_project.mappers.user.ProfileMapper;
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

    @Autowired
    ProfileMapper profileMapper;

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
        gosuDTO.setId("고수3");
        gosuDTO.setType("type1");
        gosuDTO.setRegion("대전");
        List<RequestDTO> requestDTOS = requestMapper.readRequest(gosuDTO);
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
    public void expertData() {
        List<ExpertPortfolioDTO> expertPortfolios = profileMapper.getExpertPortfolios(2);
        log.info(expertPortfolios);
    }
}
