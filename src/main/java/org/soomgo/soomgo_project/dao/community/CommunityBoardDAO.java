package org.soomgo.soomgo_project.dao.community;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;
import org.soomgo.soomgo_project.mappers.community.CommunityBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class CommunityBoardDAO {


    private final CommunityBoardMapper communityBoardMapper;

    public void create(CommunityBoardDTO board){
        communityBoardMapper.create(board);
    }

    public CommunityBoardDTO read(int cb_no){
        return communityBoardMapper.read(cb_no);
    }

    public void update(CommunityBoardDTO board){
        communityBoardMapper.update(board);
    }

    public void delete(int cb_no){
        communityBoardMapper.delete(cb_no);
    }

    public List<CommunityBoardDTO> listAll(String service, String place){
        Map<String,Object> params = new HashMap<>();
        params.put("service",service);
        params.put("place",place);

        return communityBoardMapper.listAll(params);
    }

    public List<CommunityBoardDTO> listByBoardNo(int board_no, String service, String place){
        Map<String,Object> params = new HashMap<>();
        params.put("board_no",board_no);
        params.put("service",service);
        params.put("place",place);

        return communityBoardMapper.listByBoardNo(params);
    }

    public boolean isLiked(Map<String, Object> params){
        return communityBoardMapper.isLiked(params);
    }

    public void increaseLike(Map<String, Object> params){
        communityBoardMapper.increaseLike(params);
    }

    public void updateLikeCount(Map<String, Object> params){
        communityBoardMapper.updateLikeCount(params);
    }

    public void removeLike(Map<String, Object> params){
        communityBoardMapper.removeLike(params);
    }

    public void decrementLikeCount(Map<String, Object> params){
        communityBoardMapper.decrementLikeCount(params);
    }

    public int getLikeCount(int cb_no){
        return communityBoardMapper.getLikeCount(cb_no);
    }

    public void lookAtThis (int cb_no){
        communityBoardMapper.lookAtThis(cb_no);
    }
}
