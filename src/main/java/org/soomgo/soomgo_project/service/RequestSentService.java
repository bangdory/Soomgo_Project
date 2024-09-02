package org.soomgo.soomgo_project.service;

import org.soomgo.soomgo_project.domain.requestDTO;

import java.util.List;

public interface RequestSentService {
    List<requestDTO> getRequestsByUserEmail(String email);
}
