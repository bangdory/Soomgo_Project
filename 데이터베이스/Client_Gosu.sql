-- 테스트용 간단 고객, 고수 테이블 작성
drop table ctest, gTest;
create table cTest
(
    num    int auto_increment primary key,
    id     varchar(20),
    region varchar(20)
)
;
create table gTest
(
    num    int auto_increment primary key,
    id     varchar(20),
    region varchar(20),
    type   varchar(20)
)
;

insert into ctest(id, region)
values ('고객2', '부산');
select *
from ctest;
select *
from gtest;

-- INNER JOIN 쿼리
/*SELECT r.writer,
       r.region,
       c.id,
       c.region
FROM request r
         INNER JOIN
     ctest c
     ON
         r.writer = c.id
             AND r.region = c.region;*/

SELECT *
from request r
         INNER JOIN gTest g ON r.region = g.region AND r.type = g.type
where g.id = '고수1';

SELECT r.*
from request r
         INNER JOIN gTest g ON r.region = '광주' AND r.type = 'type3'
where g.id = '고수2';

SELECT r.*
from request r
         INNER JOIN gTest g ON r.region = g.region AND r.type = g.type
where g.id = '고수3';