--�ٹ�

--�ٹ� ��� ���� ���
select *
from album;

--������ ���� ������ �ٹ���, ��Ƽ��Ʈ, ���� ���
select album_title, album_artist, album_fixed_price
from album
order by album_fixed_price;

--������ ���� ������ �ٹ���, ��Ƽ��Ʈ, ���� ���
select album_title, album_artist, album_fixed_price
from album
order by album_fixed_price desc;

--�ٹ� �߸����� ���� ������ �ٹ� ������ ���
select album_release_date, album_title, album_artist, album_genre, album_fixed_price
from album
order by album_release_date;

--�帣�� �ٹ� �˻�
select album_genre, album_title, album_artist, album_fixed_price
from album
where album_genre='����'
order by album_title;

--�ٹ������� �˻��ϱ�(�̸� ��)
select album_id, album_title, album_artist, album_genre, album_fixed_price
from album
where album_title like '%P%'
order by album_title;

--��īƮ�� ������ ��ǰ �ֱ�
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



--����� ���̵�� ��īƮ Ȯ��
select album_title, album_fixed_price, album_quantity
from book_cart c, album b
where c.album_id = b.album_id and c.user_id = 'anjgkwl45';




--��īƮ �� �ݾ� ��
create view total_album_price
as select user_id, (album_fixed_price*album_quantity)as album_total_price
from book_cart c, album b
where  c.album_id = b.album_id;

select *
from total_album_price
where user_id = 'anjgkwl45';


--�ٹ� ����
insert into payment_info(payment_method, payment_date, payment_total, user_id)
values ('�ſ�ī��', '20201127', (
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


--���� ���� Ȯ��
select * 
from payment_info;

delete payment_info;

--��īƮ���� �ֹ����� ������ ����
delete
from book_cart
where user_id = 'anjgkwl45';

select *
from book_cart;

--����� ���� Ȯ��
select *
from users
where user_id='anjgkwl45';






-- ���ϸ��� ������ view ����
create view mileage_price
as select user_id, album_total_price * 0.01 as mileage_price -- 1% ����
from total_album_price;

select * 
from mileage_price;

drop view mileage_price;

--���ϸ��� ����
insert into mileage(user_id, mil_price, mil_date)
values('anjgkwl45', 
    (select mileage_price 
    from mileage_price
    where user_id = 'anjgkwl45'), systimestamp);
commit; 

select * 
from mileage;

delete from mileage;