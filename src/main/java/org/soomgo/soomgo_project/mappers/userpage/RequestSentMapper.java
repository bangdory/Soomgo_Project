package org.soomgo.soomgo_project.mappers.userpage;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.soomgo.soomgo_project.domain.userpage.RequestSentDTO;  // 클래스 이름 변경
import java.util.List;

@Mapper
public interface RequestSentMapper {
    List<RequestSentDTO> getRequestsByUserEmail(@Param("email") String email);  // 반환 타입 변경
}
