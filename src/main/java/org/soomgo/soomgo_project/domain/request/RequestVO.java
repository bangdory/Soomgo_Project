package org.soomgo.soomgo_project.domain.request;

import lombok.Data;
import lombok.Getter;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

@Getter
public class RequestVO {
    private int id;
    private int userNum;
    private String expertNum;
    private LocalDateTime regDate;
    //
    private String CategoryName;
    //
    private String district;
    private String sub;
    private int category;
    private int type;
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
    private int region;
    private String ref;


    public RequestVO() {
        this.regDate = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
    }
}