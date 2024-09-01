package org.soomgo.soomgo_project.domain.request;

import lombok.Data;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

@Data
public class RequestTestDTO {
    private int id; // 견적서 번호
    private int userNum; // 고객 번호
    private String expertNum; // 고수 번호
    private LocalDateTime regDate; // 작성일
    private int category; // 카테고리
    private int type; // 세부 타입
    private String sub; // 추가 타입
    private String file1; // 파일1
    private String file2; // 파일2
    private Boolean cr; // 상업용도
    private String amount; // 작업량
    private String addService; // 추가 서비스
    private String delService; // ????
    private String result; // 결과물 종류
    private String day; // 요일
    private String time; // 시간대
    private int age; // 연령
    private String sex; // 성별
    private String fav; // 선호 성별
    private String place; // 장소
    private String date; // 시작 및 마감일
    private int region; // 지역
    private String ref; // 기타

    public RequestTestDTO() {
        this.regDate = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
    }
}