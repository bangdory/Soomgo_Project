package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

@Data
// 사용 안함
public class UpdateRequestDTO {
    private String gosuId;
    private int price;
    private String replyRef;
    private String replyFile;
    private int requestId;
}
