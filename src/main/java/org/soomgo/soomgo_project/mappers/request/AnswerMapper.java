package org.soomgo.soomgo_project.mappers.request;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;

import java.util.List;

@Mapper
public interface AnswerMapper {
    int answerRequest(AnswerRequestDTO answerRequestDTO);

    List<AnswerRequestDTO> answerList(int requestId);
}
