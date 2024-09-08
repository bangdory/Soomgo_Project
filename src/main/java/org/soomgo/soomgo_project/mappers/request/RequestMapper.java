package org.soomgo.soomgo_project.mappers.request;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.request.*;

import java.util.List;

@Mapper
public interface RequestMapper {
    // 고객 요청서 등록
    int insert(RequestDTO requestDTO);

    // 고객이 보낸 요청서 리스트
    List<RequestVO> getListByClientNo(int clientNo);

    //
    RequestDTO select(int requestId);
    // 개별 요청서 확인용
    RequestVO selectedRequest(int requestId);
    // 답변 달린 요청서 확인용 -> 작성할 것
//    AnswerRequestVO answeredRequest(int requestId);

    // 고수가 받은 요청서
    List<RequestVO> readRequestByExpertNum(int expertNum);

    // 고수가 답장한 견적서
    List<RequestVO> answeredRequestByExpertNum(int expertNum);
    // 견적이 달린 요청서 리스트 (고객확인용)
    List<AnswerRequestVO> answerListOfSelectedRequest(int requestId);

    // 고수 찾기
//    ExpertVO findExpert(int expertNum);
    ExpertVO findExpert(int expertNum);

    // 지역 찾기 (도시)
    List<String> findAllStates();

    // 지역 찾기 (시,군,구)
    List<TerritoryDTO> findTerritoryByState(String state);

    // 서비스 카테고리
    List<String> findAllCategory();

    // 서비스 종류
    List<CategoryDTO> findType(String type);

    CategoryDTO selectedType(String selectedType);

    int deletedRequestByClient(int requestId);
}
