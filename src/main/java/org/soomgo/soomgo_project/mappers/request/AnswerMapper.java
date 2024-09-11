package org.soomgo.soomgo_project.mappers.request;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;
import org.soomgo.soomgo_project.domain.request.AnswerRequestVO;

@Mapper
public interface AnswerMapper {
    int answerRequest(AnswerRequestDTO answerRequestDTO);


    // 요청서 상태 업데이트
//    int update(AnswerRequestDTO answerRequestDTO);
    int update(AnswerRequestDTO answerRequestDTO);

    int ignoreAnswerRequest(AnswerRequestVO answerRequestVO);

    void ignoreReceivedRequest(
            @Param("id") int id,
            @Param("expertNum") int expertNum
    );

    AnswerRequestVO findAnswerRequestVOById(int answerRequestID);
}
