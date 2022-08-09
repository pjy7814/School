create table reservation(
	id varchar(20) NOT NULL,
    rname varchar(20) not null,
    rdate varchar(20) not null,
    rtime varchar(20) not null,
    room varchar(20) not null,
    Primary key(rdate, rtime, room)
    );

create table kpuStudent(
	id varchar(20) NOT NULL Primary Key,
    passwd varchar(20) not null,
    kpuName varchar(20) not null
);

insert into kpuStudent values('2019156013', 'passwd', '박지영');
insert into kpuStudent values('11112222', 'passwd', '홍길동');
insert into reservation values('2019156013', '박지영', '2021-11-22', '9:00-11:00', '제 4 스터디룸');
insert into reservation values('2019156013', '박지영', '2021-11-22', '11:00-13:00', '제 4 스터디룸');
insert into reservation values('11112222', '홍길동', '2021-11-24', '9:00-11:00', '제 4 스터디룸');
insert into reservation values('11112222', '홍길동', '2021-11-25', '9:00-11:00', '제 5 스터디룸');
insert into kpuStudent values('admin', 'passwd', '관리자');