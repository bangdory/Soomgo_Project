package org.soomgo.soomgo_project.service.community;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.community.CommunityReplyDAO;
import org.soomgo.soomgo_project.domain.community.CommunityReplyDTO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommunityReplyService {

    private final CommunityReplyDAO communityReplyDAO;

    public void register(CommunityReplyDTO reply){
        communityReplyDAO.create(reply);
    }

    public CommunityReplyDTO getReply(Map<String, Object> params){
        return communityReplyDAO.getReply(params);
    }

    public void modify(CommunityReplyDTO reply){
        communityReplyDAO.update(reply);
    }

    public CommunityReplyDTO getReplyUpdate(Map<String, Object> params){
        return communityReplyDAO.getReplyUpdate(params);
    }

    public void delete(int cr_no){
        communityReplyDAO.delete(cr_no);
    }

    public List<CommunityReplyDTO> read(int cb_no){
        return communityReplyDAO.read(cb_no);
    }

    public boolean isLike(int cr_no, int user_num){
        return communityReplyDAO.isLiked(cr_no, user_num);
    }
}
