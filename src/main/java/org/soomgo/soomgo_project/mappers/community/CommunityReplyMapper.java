package org.soomgo.soomgo_project.mappers.community;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.community.CommunityReplyDTO;
import org.soomgo.soomgo_project.service.community.CommunityBoardServiceImpl;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommunityReplyMapper {

    void create(CommunityReplyDTO reply);

    CommunityReplyDTO getReply(Map<String, Object> params);

    void update(CommunityReplyDTO reply);

    void delete(Integer cr_no);

    List<CommunityReplyDTO> read(Integer cb_no);

    boolean isLiked(Integer cr_no, Integer user_num);

    void increaseLike(Integer cr_no, Integer user_num);

    void updateLikeCount(Integer cr_no);

    void removeLike(Integer cr_no, Integer user_num);

    void decreaseLikeCount(Integer cr_no);

    int getLikeCount(Integer cr_no);

}
