package org.soomgo.soomgo_project.dao.community;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.community.CommunityReplyDTO;
import org.soomgo.soomgo_project.mappers.community.CommunityReplyMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class CommunityReplyDAO {

    private final CommunityReplyMapper communityReplyMapper;


    public void create(CommunityReplyDTO crp) {
        communityReplyMapper.create(crp);
    }

    public CommunityReplyDTO getReply(Map<String, Object> params){
        return communityReplyMapper.getReply(params);
    }

    public void update(CommunityReplyDTO crp) {
        communityReplyMapper.update(crp);
    }

    public CommunityReplyDTO getReplyUpdate(Map<String, Object> params){
        return communityReplyMapper.getReplyUpdate(params);
    }

    public void delete(int cr_no) {
        communityReplyMapper.delete(cr_no);
    }

    public List<CommunityReplyDTO> read(int cb_no) {
        return communityReplyMapper.read(cb_no);
    }

    public boolean isLiked(int cr_no, int user_num) {
        return communityReplyMapper.isLiked(cr_no, user_num);
    }
}
