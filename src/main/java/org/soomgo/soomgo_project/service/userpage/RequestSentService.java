package org.soomgo.soomgo_project.service.userpage;

import org.soomgo.soomgo_project.domain.userpage.requestDTO;

import java.util.List;

public interface RequestSentService {
    List<requestDTO> getRequestsByUserEmail(String email);
}
