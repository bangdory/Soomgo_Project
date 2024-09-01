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
create table 1answerRequest
(
    no        int auto_increment primary key      not null,
    RequestId int                                 null,
    category  int                                 not null,
    expert    int                         not null,
    price     int                                 null,
    ref       varchar(1000)                       null,
    file      varchar(2000)                       null,
    replyDate timestamp default CURRENT_TIMESTAMP null
);