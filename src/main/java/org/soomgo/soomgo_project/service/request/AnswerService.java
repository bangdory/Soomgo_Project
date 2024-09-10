package org.soomgo.soomgo_project.service.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.request.AnswerRequestDTO;
import org.soomgo.soomgo_project.domain.request.AnswerRequestVO;
import org.soomgo.soomgo_project.mappers.request.AnswerMapper;
import org.soomgo.soomgo_project.mappers.request.RequestMapper;
import org.soomgo.soomgo_project.mappers.userpage.UserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class AnswerService {
    private final AnswerMapper answerMapper;
    private final RequestMapper requestMapper;
    private final UserMapper userMapper;

    public AnswerRequestVO findAnswerRequestVOById(int answerRequestId) {
        return answerMapper.findAnswerRequestVOById(answerRequestId);
    }

    public boolean modifyOriginalRequest(AnswerRequestDTO answerRequestDTO) {
        int updateCount = answerMapper.update(answerRequestDTO);
        return updateCount == 1;
    }

    public void answerRequest(AnswerRequestDTO answerRequestDTO) {
        answerMapper.answerRequest(answerRequestDTO);
    }

    public void ignoreAnswerRequestByExpert(AnswerRequestVO answerRequestVO) {
        answerMapper.ignoreAnswerRequest(answerRequestVO);
    }

    public void ignoreReceivedRequestByExpert(int requestId, int expertNum) {
        answerMapper.ignoreReceivedRequest(requestId, expertNum);
    }

}
