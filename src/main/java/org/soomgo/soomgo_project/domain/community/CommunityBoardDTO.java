package org.soomgo.soomgo_project.domain.community;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CommunityBoardDTO {
    private int cb_no;
    private int board_no;
    private String cb_title;
    private String cb_content;
    private String cb_file;
    private int user_num;
    private String user_name;
    private int categoryNum;
    private String categoryName;
    private int cb_addr;
    private String state;
    private String district;
    private int cb_currentview;
    private int cb_view;
    private int cb_like;
    private String cb_regdate;
}
