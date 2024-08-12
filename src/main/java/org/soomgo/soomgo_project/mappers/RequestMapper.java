package org.soomgo.soomgo_project.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.*;

import java.util.List;

@Mapper
public interface RequestMapper {
    int insert(RequestDTO requestDTO);

    List<RequestDTO> getList();

    RequestDTO select(int id);

    List<RequestDTO> readRequest(GosuDTO gosuDTO);

    GosuDTO findGosu(String id);

    List<String> findAllStates();

    List<TerritoryDTO> findTerritoryByState(String state);

//    List<TerritoryDTO> findTerritory();

    List<String> findType(String type);
}
