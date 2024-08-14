package org.soomgo.soomgo_project.mappers.request;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.request.*;

import java.util.List;

@Mapper
public interface RequestMapper {
    int insert(RequestDTO requestDTO);

    List<RequestDTO> getList();

    RequestDTO select(int id);

    List<RequestDTO> readReceivedRequestByGosuId(GosuDTO gosuDTO);

    List<RequestDTO> answeredRequest(GosuDTO gosuDTO);

    RequestDTO answerRequest(AnswerRequestDTO answerRequestDTO);

    GosuDTO findGosu(String id);

    List<String> findAllStates();

    List<TerritoryDTO> findTerritoryByState(String state);

    List<CategoryDTO> findType(String type);

    List<String> findAllCategory();

    int update(UpdateRequestDTO updateRequestDTO);
}
