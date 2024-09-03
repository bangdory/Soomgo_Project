package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

@Data
public class RequestDTO {
    private int id;
    private int userNum;
    private String expertNum;
    private LocalDateTime regDate;
    private int categoryNum;
    private int typeNum;
    private String sub;
    private String file1;
    private String file2;
    private Boolean cr; // Null 값 넣기 위해서 래퍼 클래스로 설정
    private String amount;
    private String addService;
    private String delService;
    private String result;
    private String day;
    private String time;
    private Integer age;
    private String sex;
    private String fav;
    private String place;
    private String date;
    private int regionNum;
    private String ref;

    public RequestDTO() {
        this.regDate = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
    }
}