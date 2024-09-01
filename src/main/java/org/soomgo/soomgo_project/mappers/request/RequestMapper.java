package org.soomgo.soomgo_project.mappers.request;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.request.*;

import java.util.List;

@Mapper
public interface RequestMapper {
    // 고객 요청서 등록
    int insert(RequestDTO requestDTO);

    // 고객이 보낸 요청서 리스트
    List<RequestDTO> getListByClientNo(int clientNo);

    //
    RequestDTO select(int id);

    // 고수가 받은 요청서
    List<RequestDTO> readRequestByExpertNum(int expertNum);

    // 고수가 답장한 견적서
    List<RequestDTO> answeredRequestByExpertNum(int expertNum);

    // 고수들이 만든 답장 리스트
    int answerRequest(AnswerRequestDTO answerRequestDTO);

    // 고수 찾기
    ExpertDTO findExpert(int expertNum);

    // 지역 찾기 (도시)
    List<String> findAllStates();

    // 지역 찾기 (시,군,구)
    List<TerritoryDTO> findTerritoryByState(String state);

    // 서비스 카테고리
    List<String> findAllCategory();

    // 서비스 종류
    List<CategoryDTO> findType(String type);

    CategoryDTO selectedType(String selectedType);

    // 요청서 상태 업데이트
    int update(AnswerRequestDTO answerRequestDTO);
}
