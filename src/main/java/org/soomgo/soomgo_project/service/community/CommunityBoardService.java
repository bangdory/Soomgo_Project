package org.soomgo.soomgo_project.service.community;

import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;

import java.util.List;

public interface CommunityBoardService {

    void register(CommunityBoardDTO board);

    CommunityBoardDTO read(int cb_no);

    void update(CommunityBoardDTO board);

    void delete(int cb_no);

    List<CommunityBoardDTO> listAll();

    List<CommunityBoardDTO> listByBoardNo(int board_no);

    boolean isLiked(int cb_no, int user_num);

    void increaseLike(int cb_no, int user_num);

    void removeLike(int cb_no, int user_num);

    int getLikeCount(int cb_no);

    void lookAtThis(int cb_no);
}
