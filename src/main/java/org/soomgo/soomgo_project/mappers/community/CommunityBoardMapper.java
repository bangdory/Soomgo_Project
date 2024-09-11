package org.soomgo.soomgo_project.mappers.community;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommunityBoardMapper {

    int create(CommunityBoardDTO board);

    CommunityBoardDTO read(Integer cb_no);

    int update(CommunityBoardDTO board);

    void delete(Integer cb_no);

    List<CommunityBoardDTO> listAll();

    List<CommunityBoardDTO> listByBoardNo(Integer board);

    List<CommunityBoardDTO> communitySearch(Map<String, Object> params);

    boolean isLiked(Map<String, Object> params);

    void increaseLike(Map<String, Object> params);

    void updateLikeCount(Map<String, Object> params);

    void removeLike(Map<String, Object> params);

    void decrementLikeCount(Map<String, Object> params);

    int getLikeCount(Integer cb_no);

    void lookAtThis (Integer cb_no);

}
