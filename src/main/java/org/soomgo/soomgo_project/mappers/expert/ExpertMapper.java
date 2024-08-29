package org.soomgo.soomgo_project.mappers.expert;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;

import java.util.List;

@Mapper
public interface ExpertMapper {

    List<ExpertDTO> getExpertList();
}
