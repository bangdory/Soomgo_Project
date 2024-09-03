package org.soomgo.soomgo_project.service.user;

import org.soomgo.soomgo_project.domain.user.requestDTO;

import java.util.List;

public interface RequestSentService {
    List<requestDTO> getRequestsByUserEmail(String email);
}
