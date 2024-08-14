create DATABASE soomgodb;
drop table test;
CREATE TABLE test
(
    id      INT AUTO_INCREMENT PRIMARY KEY NOT NULL, -- 제안서 번호
    writer  varchar(20)                            NOT NULL, -- newbie 번호
    regDate TIMESTAMP default now()        NOT NULL, -- 제안서 작성 시간
    ref     varchar(200)                             -- 필요한 서비스(2)
);


select *
from test;

select *
from test
where id = 14;