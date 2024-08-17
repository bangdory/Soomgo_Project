package org.soomgo.soomgo_project.service.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;
import org.soomgo.soomgo_project.domain.request.UpdateRequestDTO;
import org.soomgo.soomgo_project.mappers.request.AnswerMapper;
import org.soomgo.soomgo_project.mappers.request.RequestMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class AnswerService {
    private final AnswerMapper answerMapper;
    private final RequestMapper requestMapper;

    public boolean modify(UpdateRequestDTO updateRequestDTO) {
        int updateCount = requestMapper.update(updateRequestDTO);
        return updateCount == 1;
    }

    public List<AnswerRequestDTO> readAnsweredList(String clientId) {
        return answerMapper.answerList(clientId);
    }
}
