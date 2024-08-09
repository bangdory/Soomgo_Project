package org.soomgo.soomgo_project.service;

import org.soomgo.soomgo_project.domain.requestDTO;
import org.soomgo.soomgo_project.mappers.RequestSentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RequestSentServiceImpl implements RequestSentService {

    private final RequestSentMapper requestMapper;

    @Autowired
    public RequestSentServiceImpl(RequestSentMapper requestMapper) {
        this.requestMapper = requestMapper;
    }

    @Override
    public List<requestDTO> getRequestsByUserEmail(String email) {
        return requestMapper.getRequestsByUserEmail(email);
    }
}
