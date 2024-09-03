package org.soomgo.soomgo_project.mappers.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.soomgo.soomgo_project.domain.user.requestDTO;

import java.util.List;

@Mapper
public interface RequestSentMapper {
    List<requestDTO> getRequestsByUserEmail(@Param("email") String email);
}
