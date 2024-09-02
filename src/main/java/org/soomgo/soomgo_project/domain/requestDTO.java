package org.soomgo.soomgo_project.domain;


import lombok.Data;

import java.time.LocalDateTime;

@Data
public class requestDTO {
    private int id;
    private String writer;
    private LocalDateTime regDate;
    private String sort;
    private String type;
    private String sub;
    private String file1;
    private String file2;
    private String cr;
    private String amount;
    private String addService;
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

}
