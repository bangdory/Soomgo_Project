package org.soomgo.soomgo_project.service.community;

import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;

import java.util.List;
import java.util.Map;

public interface CommunityBoardService {

    void register(CommunityBoardDTO board);

    CommunityBoardDTO read(Integer cb_no);

    void update(CommunityBoardDTO board);

    void delete(int cb_no);

    List<CommunityBoardDTO> listAll(String service, String place);

    List<CommunityBoardDTO> listByBoardNo(int board_no, String service, String place);

    boolean isLiked(Map<String, Object> params);

    void increaseLike(Map<String, Object> params);

    void removeLike(Map<String, Object> params);

    int getLikeCount(int cb_no);

    void lookAtThis(int cb_no);
}
