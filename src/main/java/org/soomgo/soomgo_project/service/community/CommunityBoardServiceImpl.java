package org.soomgo.soomgo_project.service.community;

import org.soomgo.soomgo_project.dao.community.CommunityBoardDAO;
import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;
import org.soomgo.soomgo_project.mappers.community.CommunityBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityBoardServiceImpl implements CommunityBoardService {

    private final CommunityBoardDAO communityBoardDAO;
    private CommunityBoardMapper communityBoardMapper;

    @Autowired
    public CommunityBoardServiceImpl(CommunityBoardDAO communityBoardDAO) {
        this.communityBoardDAO = communityBoardDAO;
    }
    @Override
    public void register(CommunityBoardDTO board){
        if (board.getCb_file() == null){
            board.setCb_file(null);
        }
        communityBoardDAO.create(board);
    }
    @Override
    public CommunityBoardDTO read(int cb_no){
        return communityBoardDAO.read(cb_no);
    }

    @Override
    public void update(CommunityBoardDTO board){
        communityBoardDAO.update(board);
    }

    @Override
    public void delete(int cb_no){
        communityBoardDAO.delete(cb_no);
    }

    @Override
    public List<CommunityBoardDTO> listAll(){
        return communityBoardDAO.listAll();
    }

    @Override
    public List<CommunityBoardDTO> listByBoardNo(int board_no){
        return communityBoardDAO.listByBoardNo(board_no);
    }

    @Override
    public boolean isLiked(int cb_no, int user_num){
        return communityBoardDAO.isLiked(cb_no, user_num);
    }

    @Override
    public void increaseLike(int cb_no, int user_num){
        communityBoardDAO.increaseLike(cb_no, user_num);
        communityBoardDAO.updateLikeCount(cb_no);
    }

    @Override
    public void removeLike(int cb_no, int user_num) {
        communityBoardDAO.removeLike(cb_no, user_num);
        communityBoardDAO.decrementLikeCount(cb_no);
    }

    @Override
    public int getLikeCount(int cb_no){
        return communityBoardDAO.getLikeCount(cb_no);
    }

    @Override
    public void lookAtThis(int cb_no) {
        communityBoardDAO.lookAtThis(cb_no);
    }
}




