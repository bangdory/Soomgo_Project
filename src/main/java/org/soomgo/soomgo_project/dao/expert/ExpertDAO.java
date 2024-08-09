package org.soomgo.soomgo_project.dao.expert;

import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.mappers.expert.ExpertMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ExpertDAO {

    private final ExpertMapper expertMapper;


    public ExpertDAO(ExpertMapper expertMapper) {
        this.expertMapper = expertMapper;
    }


    public List<ExpertDTO> getExpertList(){
        return expertMapper.getExpertList();
    }

}
