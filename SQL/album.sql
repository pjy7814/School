--앨범

--앨범 모든 정보 출력
select *
from album;

--가격이 낮은 순으로 앨범명, 아티스트, 가격 출력
select album_title, album_artist, album_fixed_price
from album
order by album_fixed_price;

--가격이 높은 순으로 앨범명, 아티스트, 가격 출력
select album_title, album_artist, album_fixed_price
from album
order by album_fixed_price desc;

--앨범 발매일이 가장 오래된 앨범 순으로 출력
select album_release_date, album_title, album_artist, album_genre, album_fixed_price
from album
order by album_release_date;

--장르별 앨범 검색
select album_genre, album_title, album_artist, album_fixed_price
from album
where album_genre='가요'
order by album_title;

--앨범명으로 검색하기(이름 순)
select album_id, album_title, album_artist, album_genre, album_fixed_price
from album
where album_title like '%P%'
order by album_title;

--북카트에 지정한 상품 넣기
insert into book_cart(user_id, album_id,  album_quantity)
values ('anjgkwl45', 'I1257752', 2);
insert into book_cart(user_id, album_id,  album_quantity)
values ('hsheo', 'DW31574', 1);
insert into book_cart(user_id, album_id,  album_quantity)
values ('lghgdh', 'VDCD6806', 3);
insert into book_cart(user_id, album_id,  album_quantity)
values('khk91ep', 'DU42213',1);
insert into book_cart(user_id, album_id,  album_quantity)
values ('hsheo','L200001955',1);


select *
from book_cart;



--사용자 아이디로 북카트 확인
select album_title, album_fixed_price, album_quantity
from book_cart c, album b
where c.album_id = b.album_id and c.user_id = 'anjgkwl45';




--북카트 총 금액 뷰
create view total_album_price
as select user_id, (album_fixed_price*album_quantity)as album_total_price
from book_cart c, album b
where  c.album_id = b.album_id;

select *
from total_album_price
where user_id = 'anjgkwl45';


--앨범 구매
insert into payment_info(payment_method, payment_date, payment_total, user_id)
values ('신용카드', '20201127', (
            select album_total_price
            from total_album_price
            where user_id = 'anjgkwl45'),
            'anjgkwl45');
update users
set rating_num_order =rating_num_order + 1
where user_id = 'anjgkwl45'; 
commit;

update users
set user_total=user_total+(
    select album_total_price
    from total_album_price
    where user_id='anjgkwl45')
where user_id='anjgkwl45';


--결제 내역 확인
select * 
from payment_info;

delete payment_info;

--북카트에서 주문자의 데이터 삭제
delete
from book_cart
where user_id = 'anjgkwl45';

select *
from book_cart;

--사용자 정보 확인
select *
from users
where user_id='anjgkwl45';






-- 마일리지 적립액 view 생성
create view mileage_price
as select user_id, album_total_price * 0.01 as mileage_price -- 1% 적립
from total_album_price;

select * 
from mileage_price;

drop view mileage_price;

--마일리지 적립
insert into mileage(user_id, mil_price, mil_date)
values('anjgkwl45', 
    (select mileage_price 
    from mileage_price
    where user_id = 'anjgkwl45'), systimestamp);
commit; 

select * 
from mileage;

delete from mileage;