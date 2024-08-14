package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

@Data
public class AnswerRequestDTO {
    private int no;
    private int RequestNo;
    private String type;
    private String GosuId;
    private String price;
    private String ref;
    private String file;
}
