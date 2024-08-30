package org.soomgo.soomgo_project.service.request;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.soomgo.soomgo_project.domain.expert.ExpertDTO;
import org.soomgo.soomgo_project.domain.request.*;
import org.soomgo.soomgo_project.domain.userpage.UserDTO;
import org.soomgo.soomgo_project.mappers.request.RequestMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Log4j2
@RequiredArgsConstructor // 의존성 주입 -> 생성자 정의
@Transactional
public class RequestService {

    // Mapper 만 바라볼 것!!
    private final RequestMapper requestMapper; // 처음부터 만들어져야 함, 생성자 정의

    public int register(RequestDTO requestDTO) {
        log.info("==========================" + requestDTO);

        int count = requestMapper.insert(requestDTO);// BoardMapper 인터페이스에서 만든 int 값이 하나 나옴

        return requestDTO.getId();
    }

    public List<RequestDTO> list(int clientNo) {
        return requestMapper.getListByClientNo(clientNo);
    }

    public RequestDTO getRequest(int requestId) {
        return requestMapper.select(requestId);
    }

    public List<RequestDTO> readReceivedRequests(UserDTO userDTO) {
        return requestMapper.readRequestByExpertNum(userDTO.getUser_num());
    }


    public List<RequestDTO> readAnsweredRequests(UserDTO userDTO) {
        return requestMapper.answeredRequestByExpertNum(userDTO.getUser_num());
    }

    public ExpertDTO findExpert(int expertNum) {
        return requestMapper.findExpert(expertNum);
    }

    public List<String> findAllStates() {
        return requestMapper.findAllStates();
    }

    public List<TerritoryDTO> findTerritory(String state) {
        return requestMapper.findTerritoryByState(state);
    }

    public List<String> findAllCategory() {
        return requestMapper.findAllCategory();
    }

    public List<CategoryDTO> findCategory(String type) {
        return requestMapper.findType(type);
    }

/*
    public boolean modify(UpdateRequestDTO updateRequestDTO) {
        int updateCount = requestMapper.update(updateRequestDTO);
        return updateCount == 1;
    }
*/

    public boolean remove(int id) {
        return true; // 08.06 -> 나중에 추가할 것
    }
}
