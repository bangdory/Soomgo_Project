package org.soomgo.soomgo_project.domain.request;

import lombok.Data;
import lombok.Getter;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

@Getter
public class RequestVO extends RequestDTO {

    private int id;
    private int userNum;
    private String userName; // 이름
    private String expertNum;
    private String expertName; // 고수 이름
    private LocalDateTime regDate;
    private int categoryNum;
    private int type;
    private String typeName; // 카테고리 이름
    private String sub;
    private String file1;
    private String file2;
    private Boolean cr;
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
    private String regionName; // 지역 이름
    private String ref;
}