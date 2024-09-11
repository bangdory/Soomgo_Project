package requestSample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.soomgo.soomgo_project.domain.request.RequestDTO;
import org.soomgo.soomgo_project.domain.territory.TerritoryDTO;
import org.soomgo.soomgo_project.mappers.request.RequestMapper;
import org.soomgo.soomgo_project.mappers.territory.TerritoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class SampleDBTest {
    @Autowired (required = false)
    RequestMapper requestMapper;
    @Autowired(required = false)
    TerritoryMapper territoryMapper;
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

    @Test
    public void findTerritory() {
        List<TerritoryDTO> territory = territoryMapper.getTerritory();
        log.info(territory);
    }
}
