package org.soomgo.soomgo_project.mappers.community;

import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;

import java.util.List;

public interface CommunityBoardMapper {

    int create(CommunityBoardDTO board);

    CommunityBoardDTO read(Integer cb_no);

    int update(CommunityBoardDTO board);

    void delete(Integer cb_no);

    List<CommunityBoardDTO> listAll();

    List<CommunityBoardDTO> listByBoardNo(Integer board_no);

    boolean isLiked(Integer cb_no, Integer user_num);

    void increaseLike(Integer cb_no, Integer user_num);

    void updateLikeCount(Integer cb_no);

    void removeLike(Integer cb_no, Integer user_num);

    void decrementLikeCount(Integer cb_no);

    int getLikeCount(Integer cb_no);

    void lookAtThis (Integer cb_no);

}
