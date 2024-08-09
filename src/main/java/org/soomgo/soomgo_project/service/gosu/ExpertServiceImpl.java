package org.soomgo.soomgo_project.service.gosu;

import org.soomgo.soomgo_project.dao.expert.ExpertDAO;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpertServiceImpl implements ExpertService{

    private final ExpertDAO expertDAO;

    @Autowired
    public ExpertServiceImpl(ExpertDAO expertDAO) {
        this.expertDAO = expertDAO;
    }

    @Override
    public List<ExpertDTO> getExpertList(){
        return expertDAO.getExpertList();
    }

}
