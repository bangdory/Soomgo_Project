package org.soomgo.soomgo_project.service.gosu;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.expert.ExpertDAO;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExpertServiceImpl implements ExpertService{

    private final ExpertDAO expertDAO;

    @Override
    public List<ExpertDTO> getExpertList(){
        return expertDAO.getExpertList();
    }

}
