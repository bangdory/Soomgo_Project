package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

@Data
public class UpdateRequestDTO {
    private String gosuId;
    private int price;
    private String replyRef;
    private String replyFile;
    private int requestId;
}
