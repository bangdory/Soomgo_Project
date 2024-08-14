create DATABASE soomgodb;
CREATE TABLE request
(
    id         INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- 제안서 번호
    writer     varchar(20)                    NOT NULL, -- newbie 번호
    replier    varchar(20),                             -- 답장한 고수 번호
    regDate    TIMESTAMP default now()        NOT NULL, -- 제안서 작성 시간
    sort       varchar(20)                    NOT NULL, -- 서비스 종류
    type       varchar(20)                    NOT NULL, -- 필요한 서비스(1)
    sub        varchar(20),                             -- 필요한 서비스(2)
    file1      JSON,                                    -- 사전 보유 파일, 지식, 진행단계 등(1)
    file2      JSON,                                    -- 사전 보유 파일, 지식, 진행단계 등(2)
    cr         BOOLEAN   default null,                  -- 상업적 이용 여부
    amount     varchar(50),                             -- 서비스 길이, 수량 등
    addService varchar(50),                             -- 추가로 필요한 서비스
    result     varchar(50),                             -- 희망하는 파일 형태 등 결과물
    day        varchar(50),                             -- 요일
    time       varchar(150),                            -- 시간대
    age        varchar(20),                             -- 연령
    sex        varchar(20),                             -- 성별
    fav        varchar(20),                             -- 선호 성별
    place      varchar(100),                            -- 서비스 장소
    date       varchar(100),                            -- 시작 날짜, 데드라인
    region     varchar(150),                            -- 서비스 지역
    ref        varchar(200)                             -- 직접 입력하는 추가사항
);
# insert into reqsend (writer, sort, type, sub, file1, file2, cr, amount, addService, result, day, time, age, sex, fav, place, date, region, ref)
# values (#{writer}, #{sort}, #{type}, #{sub}, #{file1}, #{file2}, #{cr}, #{amount}, #{addService}, #{result}, #{day}, #{time}, #{age},
#         #{sex}, #{fav}, #{place}, #{date}, #{region}, #{ref})
# alter table reqsend modify cr BOOLEAN default null;
select *
from request;

