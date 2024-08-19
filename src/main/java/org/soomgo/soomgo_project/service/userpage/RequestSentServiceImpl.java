package org.soomgo.soomgo_project.service.userpage;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.userpage.RequestSentDAO;
import org.soomgo.soomgo_project.domain.userpage.RequestSentDTO;  // 클래스 이름 변경
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RequestSentServiceImpl implements RequestSentService {

    private final RequestSentDAO requestSentDAO;

    @Override
    public List<RequestSentDTO> getRequestsByUserEmail(String email) {  // 반환 타입 변경
        return requestSentDAO.getRequestsByUserEmail(email);
    }
}
