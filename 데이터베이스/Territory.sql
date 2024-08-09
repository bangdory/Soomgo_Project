create table territory(
    no       int primary key auto_increment,
    id       int not null,
    state    varchar(50),
    district varchar(50)
);

drop table territory;

SELECT district
FROM territory
WHERE id IN (
    SELECT id
    FROM territory
    WHERE state = '강원특별자치도'
) AND district IS NOT NULL;
