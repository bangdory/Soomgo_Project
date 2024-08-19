create table AnswerRequest
(
    no        int primary key auto_increment,
    RequestNo int         not null,
    type      varchar(20) not null,
    GosuId    varchar(20) not null,
    price     varchar(50),
    ref       varchar(1000),
    file      varchar(2000),
    replyDate timestamp default now()
)
;