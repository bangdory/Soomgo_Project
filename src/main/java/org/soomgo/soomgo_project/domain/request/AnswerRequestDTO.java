package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

@Data
public class AnswerRequestDTO {
    private Integer id;
    private Integer requestId;
    private Integer expertNum;
    private Integer price;
    private String ref;
    private String file;

    public void setFile(String file) {
        if (file != null && file.trim().isEmpty()) {
            this.file = null; // 빈 문자열을 null로 변환
        } else {
            this.file = file;
        }
    }
}
