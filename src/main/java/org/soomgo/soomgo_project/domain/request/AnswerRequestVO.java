package org.soomgo.soomgo_project.domain.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

@Getter
@ToString
public class AnswerRequestVO {
    private Integer id; // 고유번호
    private Integer requestId; // 요청서번호
    private Integer userNum; // 고객번호
    private String userName; // 고객이름
    private Integer expertNum; // 고수번호
    private String expertName; // 고수이름
    private LocalDateTime replyDate; // 답변일
    private Integer typeNum; // 카테고리번호
    private String typeName; // 카테고리이름
    private String subType; // 서브카테고리
    private String file1; // 파일1
    private String file2; // 파일2
    private Integer amount; // 수량
    private Integer addService; // 추가서비스
    private String result; // 결과물종류
    private String day; // 데드라인,시작일
    private String time; // 시간대
    private Integer age; // 고객연령대
    private String sex; // 고객성별
    private String fav; // 선호하는 고수성별
    private String place; // 서비스장소
    private String date; // 서비스요일
    private Integer regionNum; // 지역번호
    private String regionName; // 지역이름
    private String refFromClient; // 고객기타사항
    private Integer price; // 견적가격
    private String refFromExpert; // 고수기타사항
    private String fileFromExpert; // 고수파일

    private Integer connected; // 고수와 매칭 여부
    private Boolean deleted;

    public AnswerRequestVO() {
        this.replyDate = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
    }
}
