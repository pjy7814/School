show databases;

use springdb;
show tables;

select * from user;
select * from subscribe;
select * from mapping;

create table user (
	id VARCHAR(20) primary key,
    passwd VARCHAR(20),
    username VARCHAR(20),
    birth VARCHAR(20),
    mobile VARCHAR(20),
    email VARCHAR(50)
);

create table subscribe(
	subId VARCHAR(20) primary key,
    subName VARCHAR(20),
    subPrice VARCHAR(20),
    subLevel VARCHAR(20),
    subLink VARCHAR(100)
);

create table mapping(
	subId VARCHAR(20),
    id VARCHAR(20),
    foreign key (subId) references subscribe(subId),
    foreign key (id) references user(id)
);

drop table user;
drop table subscribe;
drop table mapping;

insert into user(id, passwd, username, birth, mobile, email) values ('jiyoung','passwd','박지영','000619','01045550943','pjy0619@tukorea.ac.kr');

insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('AppleMusic1','AppleMusic','8900','개인','https://music.apple.com/');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('AppleMusic2','AppleMusic','13500','가족','https://music.apple.com/');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('melon1','melon','10900','Premium','https://melon.com');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('melon2','melon','7900','스트리밍클럽','https://melon.com');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('Netflix1','Netflix','9500','BASIC','https://www.netflix.com/');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('Netflix2','Netflix','13500','STANDARD','https://www.netflix.com/');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('Netflix3','Netflix','14500','PREMIUM','https://www.netflix.com/');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('spotify1','spotify','10900','정기결제','https://spotify.com');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('tving1','tving','7900','Basic','https://tving.com');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('tving2','tving ','13900','Premium','https://tving.com');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('Watcha1','Watcha','7900','BASIC','https://watcha.com/');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('Watcha2','Watcha','12900','PREMIUM','https://watcha.com/');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('wavve1','wavve','7900','Basic','https://wavve.com');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('wavve2','wavve','10900','Standard','https://wavve.com');
insert into subscribe(subId, subName, subPrice, subLevel, subLink) values ('wavve3','wavve','13900','Premium','https://wavve.com');

insert into mapping(subId, id) values('Netflix1', 'jiyoung');
insert into mapping(subId, id) values('melon1','jiyoung');