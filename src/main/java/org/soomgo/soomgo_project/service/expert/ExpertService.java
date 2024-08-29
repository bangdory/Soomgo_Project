package org.soomgo.soomgo_project.service.expert;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.expert.ExpertDAO;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.expert.PageResult;
import org.springframework.stereotype.Service;
import sun.jvm.hotspot.debugger.Page;

import java.awt.print.Pageable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ExpertService {

    private final ExpertDAO expertDAO;

    public List<ExpertDTO> getExpertList() {
        return expertDAO.getExpertList();
    }

    public List<ExpertDTO> getExpertListStateDistrict (Map<String, Integer> params) {
        return expertDAO.getExpertListStateDistrict(params);
    }

    public PageResult<ExpertDTO> findExperts(Integer categoryNum, Integer region, int page, int size) {
        int offset = (page - 1) * size;
        Map<String, Object> params = new HashMap<>();
        params.put("categoryNum", categoryNum);
        params.put("region", region);
        params.put("offset", offset);
        params.put("pageSize", size);

        List<ExpertDTO> experts = expertDAO.findExperts(params);
        int totalElements = expertDAO.countExperts(params);
        return new PageResult<>(experts, totalElements, page, size);
    }

    public ExpertDTO expertDetail (int expertNum) {
        return expertDAO.expertDetail(expertNum);
    }
}
