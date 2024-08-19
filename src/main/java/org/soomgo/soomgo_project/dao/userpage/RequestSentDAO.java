package org.soomgo.soomgo_project.dao.userpage;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.userpage.RequestSentDTO;
import org.soomgo.soomgo_project.mappers.userpage.RequestSentMapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class RequestSentDAO {
    private final RequestSentMapper requestSentMapper;

    public List<RequestSentDTO> getRequestsByUserEmail(String email) {  // 반환 타입 변경
        return requestSentMapper.getRequestsByUserEmail(email);
    }
}
