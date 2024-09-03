package org.soomgo.soomgo_project.domain.request;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class AnswerRequestVO {
    private int no;
    private int requestId;
    private String categoryNum;
    private String expertNum;
    private int price;
    private String ref;
    private String file;
}
