package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

@Data
public class AnswerRequestDTO {
    private int no;
    private int requestId;
    private String type;
    private String gosuId;
    private int price;
    private String ref;
    private String file;
}
