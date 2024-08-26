package org.soomgo.soomgo_project.mappers.expert;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Mapper
public interface ExpertMapper {

    List<ExpertDTO> getExpertList();

    List<ExpertDTO> getExpertListStateDistrict(Map<String, Integer> params);

    List<ExpertDTO> findExperts(Map<String, Object> params);

    int countExperts(Map<String, Object> params);

    ExpertDTO expertDetail(int expertNum);

}
