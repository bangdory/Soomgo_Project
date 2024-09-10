package org.soomgo.soomgo_project.dao.expert;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.mappers.expert.ExpertMapper;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ExpertDAO {

    private static final Logger log = LoggerFactory.getLogger(ExpertDAO.class);
    private final ExpertMapper expertMapper;

    public List<ExpertDTO> getExpertList() {
        log.info(expertMapper.getExpertList().toString());
        return expertMapper.getExpertList();
    }

    public List<ExpertDTO> getExpertListStateDistrict(Map<String, Integer> params) {
        return expertMapper.getExpertListStateDistrict(params);
    }

    public List<ExpertDTO> findExperts(Map<String, Object> params) {
        return expertMapper.findExperts(params);
    }

    public int countExperts(Map<String, Object> params) {
        return expertMapper.countExperts(params);
    }

    public ExpertDTO expertDetail(int expertNum) {
        return expertMapper.expertDetail(expertNum);
    }

    public int expertSignUp (ExpertDTO expertDTO) {
        return expertMapper.expertSignUp(expertDTO);
    }
}
