package org.soomgo.soomgo_project.mappers.request;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;

import java.util.List;

@Mapper
public interface AnswerMapper {
    int answerRequest(AnswerRequestDTO answerRequestDTO);



    // 요청서 상태 업데이트
//    int update(AnswerRequestDTO answerRequestDTO);
    int update(AnswerRequestDTO answerRequestDTO);
}
