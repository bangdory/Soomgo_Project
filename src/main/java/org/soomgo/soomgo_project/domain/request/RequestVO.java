package org.soomgo.soomgo_project.domain.request;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

@Getter
@ToString
public class RequestVO {
// 이 클래스는 id 로 조회하는 특정 request 임
    private int id;
    private int userNum;
    private String userName; // 이름
    private int experts; // 고수번호 -> 배열, 필요없음??
    private String expertName; // 고수 이름
    private LocalDateTime regDate;
    private int categoryNum;
    private int typeNum;
    private String typeName; // 카테고리 이름
    private String sub;
    private String file1;
    private String file2;
    private Boolean cr;
    private String amount;
    private String addService;
//    private String delService;
    private String result;
    private String day;
    private String time;
    private Integer age;
    private String sex;
    private String fav;
    private String place;
    private String date;
    private int regionNum;
    private String regionName; // 지역 이름
    private String ref;
    private int deleted; // 삭제 여부 (고객)
    private int expertAlreadyAnswered; // 이미 고수가 답장을 했는지
    private int ignored; // 고수가 이 요청서를 무시했는지
}