package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

@Data
public class AnswerRequestDTO {
    private int id;
    private int requestId;
    private int expertNum;
    private int price;
    private String ref;
    private String file;
}
