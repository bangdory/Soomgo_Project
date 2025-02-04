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
create table 1request
(
    id         int auto_increment primary key      not null,
    userNum    int                                 not null,
    expertNum  varchar(50)                         default null,
    regDate    timestamp default CURRENT_TIMESTAMP not null,
    category   int                                 not null,
    type       int                                 not null,
    sub        varchar(20)                         null,
    file1      varchar(2000)                       null,
    file2      varchar(2000)                       null,
    cr         tinyint(1)                          null,
    amount     varchar(50)                         null,
    addService varchar(50)                         null,
    result     varchar(50)                         null,
    day        varchar(50)                         null,
    time       varchar(150)                        null,
    age        int                                 null,
    sex        varchar(20)                         null,
    fav        varchar(20)                         null,
    place      varchar(100)                        null,
    date       varchar(100)                        null,
    region     int                                 null,
    ref        varchar(200)                        null
);

select t.district,
       c.CategoryName,
       r.*
from territory t,
     category c
         inner join request r on r.id = 4
where t.no = r.region
  and c.CategoryNum = r.type;

SELECT t.district     AS district,
       c.CategoryName AS CategoryName,
       r.*
-- 필요한 경우 다른 request 필드들도 추가합니다
FROM territory t
         JOIN request r ON r.id = 4
         JOIN category c ON c.CategoryNum = r.type
WHERE t.no = r.region;

select c.*
from category c
where c.CategoryNum = 29;
select t.*
from territory t
where t.no = 21;
select r.*
from request r
where r.id = 4;
select c.CategoryName
from category c
where c.P_Id is null;
select *
from category;
