package org.soomgo.soomgo_project.mappers.communityReply;

import org.soomgo.soomgo_project.domain.communityReply.CommunityReplyDTO;

import java.util.List;

public interface CommunityReplyMapper {

    int create(CommunityReplyDTO reply);

    int update(CommunityReplyDTO reply);

    void delete(Integer cr_no);

    List<CommunityReplyDTO> readAll(int cb_no);

    boolean isLiked(Integer cr_no, Integer user_num);

    void increaseLike(Integer cr_no, Integer user_num);

    void updateLikeCount(Integer cr_no);

    void removeLike(Integer cr_no, Integer user_num);

    void decreaseLikeCount(Integer cr_no);

    int getLikeCount(Integer cr_no);

}
