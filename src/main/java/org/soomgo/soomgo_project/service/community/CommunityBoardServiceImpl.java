package org.soomgo.soomgo_project.service.community;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.community.CommunityBoardDAO;
import org.soomgo.soomgo_project.domain.community.CommunityBoardDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommunityBoardServiceImpl implements CommunityBoardService {

    private final CommunityBoardDAO communityBoardDAO;

//    @Autowired
//    public CommunityBoardServiceImpl(CommunityBoardDAO communityBoardDAO) {
//        this.communityBoardDAO = communityBoardDAO;
//    }

    @Override
    public void register(CommunityBoardDTO board){
        if (board.getCb_file() == null){
            board.setCb_file(null);
        }
        communityBoardDAO.create(board);
    }

    @Override
    public CommunityBoardDTO read(Integer cb_no){
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
    public List<CommunityBoardDTO> listAll() {
        return communityBoardDAO.listAll();
    }

    @Override
    public List<CommunityBoardDTO> listByBoardNo(int board_no){
        return communityBoardDAO.listByBoardNo(board_no);
    }

    @Override
    public List<CommunityBoardDTO> communitySearch(Map<String, Object> params) {
        return communityBoardDAO.communitySearch(params);
    }

    @Override
    public boolean isLiked(Map<String, Object> params){
        return communityBoardDAO.isLiked(params);
    }

    @Override
    public void increaseLike(Map<String, Object> params){
        communityBoardDAO.increaseLike(params);
        communityBoardDAO.updateLikeCount(params);
    }

    @Override
    public void removeLike(Map<String, Object> params) {
        communityBoardDAO.removeLike(params);
        communityBoardDAO.decrementLikeCount(params);
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




