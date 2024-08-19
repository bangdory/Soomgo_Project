package org.soomgo.soomgo_project.service.userpage;

import org.soomgo.soomgo_project.domain.userpage.RequestSentDTO;  // 클래스 이름 변경
import java.util.List;

public interface RequestSentService {
    List<RequestSentDTO> getRequestsByUserEmail(String email);  // 반환 타입 변경
}
