package org.soomgo.soomgo_project.domain.communityReply;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CommunityReplyDTO {
    private int cb_no;
    private int cr_no;
    private String cr_content;
    private String cr_file;
    private int user_num;
    private int cr_like;
    private LocalDateTime cr_regdate;
}
