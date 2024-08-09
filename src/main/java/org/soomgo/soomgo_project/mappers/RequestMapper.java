package org.soomgo.soomgo_project.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.GosuDTO;
import org.soomgo.soomgo_project.domain.RequestDTO;
import org.soomgo.soomgo_project.domain.RequestList;

import java.util.List;

@Mapper
public interface RequestMapper {
    int insert(RequestDTO requestDTO);

    List<RequestDTO> getList();

    RequestDTO select(int id);

    List<RequestDTO> readRequest(GosuDTO gosuDTO);

    GosuDTO findGosu(String id);
}
