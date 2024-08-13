package org.soomgo.soomgo_project.dao.expert;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.mappers.expert.ExpertMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ExpertDAO {

    private final ExpertMapper expertMapper;

    public List<ExpertDTO> getExpertList(){
        return expertMapper.getExpertList();
    }

}
