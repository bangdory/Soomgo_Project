package org.soomgo.soomgo_project.mappers.community;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.community.CommunityReplyDTO;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommunityReplyMapper {

    void create(CommunityReplyDTO reply);

    CommunityReplyDTO getReply(Map<String, Object> params);

    void update(CommunityReplyDTO reply);

    CommunityReplyDTO getReplyUpdate(Map<String, Object> params);

    void delete(Integer cr_no);

    List<CommunityReplyDTO> read(Integer cb_no);


    boolean isLiked(Integer cr_no, Integer user_num);




}
