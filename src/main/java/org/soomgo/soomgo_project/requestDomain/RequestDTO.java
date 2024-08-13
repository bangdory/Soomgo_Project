package org.soomgo.soomgo_project.requestDomain;

import lombok.Data;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

@Data
public class RequestDTO {
    /*
        private int id;
        private String writer;
        private LocalDateTime regDate;
        private String ref;
    */
    private int id;
    private String writer;
    private LocalDateTime regDate;
    private String sort;
    private String type;
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
    private String age;
    private String sex;
    private String fav;
    private String place;
    private String date;
    private String region;
    private String ref;
    private String price;
    private String replierRef;
    private String replierFile;

    public RequestDTO() {
        this.regDate = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
    }
}