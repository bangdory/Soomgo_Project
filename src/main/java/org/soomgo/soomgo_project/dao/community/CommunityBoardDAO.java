package org.soomgo.soomgo_project.dao.community;

import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;
import org.soomgo.soomgo_project.mappers.community.CommunityBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommunityBoardDAO {


    private final CommunityBoardMapper communityBoardMapper;

    @Autowired
    public CommunityBoardDAO(CommunityBoardMapper communityBoardMapper) {
        this.communityBoardMapper = communityBoardMapper;
    }

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

    public List<CommunityBoardDTO> listAll(){
        return communityBoardMapper.listAll();
    }

    public List<CommunityBoardDTO> listByBoardNo(int board_no){
        return communityBoardMapper.listByBoardNo(board_no);
    }

    public boolean isLiked(int cb_no, int user_num){
        return communityBoardMapper.isLiked(cb_no, user_num);
    }

    public void increaseLike(int cb_no, int user_num){
        communityBoardMapper.increaseLike(cb_no, user_num);
    }

    public void updateLikeCount(int cb_no){
        communityBoardMapper.updateLikeCount(cb_no);
    }

    public void removeLike(int cb_no, int user_num){
        communityBoardMapper.removeLike(cb_no, user_num);
    }

    public void decrementLikeCount(int cb_no){
        communityBoardMapper.decrementLikeCount(cb_no);
    }

    public int getLikeCount(int cb_no){
        return communityBoardMapper.getLikeCount(cb_no);
    }

    public void lookAtThis (int cb_no){
        communityBoardMapper.lookAtThis(cb_no);
    }
}
