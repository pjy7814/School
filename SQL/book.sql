--����

-- �帣 �̾Ƴ���
select genre_name
from genre; 

-- ���� �帣 ���ÿ� ���� å ���� �̾Ƴ���
select book_title, book_fixed_price, book_publisher
from book b, genre g
where b.genre_id = g.genre_id and g.genre_name = '�Ҽ�';

-- ���ΰ� view ����
create view book_saled_price
as select book_isbn, book_fixed_price * 0.9 as book_saled_price -- å �׻� 10% ����
from book;

-- å ��� �� Ŭ���� ���� �̾Ƴ��� + ���ΰ�����
select *
from book b, book_saled_price s
where b.book_isbn = s.book_isbn and b.book_isbn = '9791190991070';

--��īƮ�� �ֱ�
insert into book_cart(user_id, book_isbn, book_quantity)
values ('pjy7814', 9791190991070, 1);
insert into book_cart(user_id, book_isbn, book_quantity)
values ('jyp0518', 9788954675987, 1);
insert into book_cart(user_id, book_isbn, book_quantity)
values ('pjy7814', 9788963723310, 2);
commit

delete book_cart;
select * from book_cart;

-- ����ڰ� ��īƮ Ȯ��
select c.book_cart_no, b.book_title, s.book_saled_price, c.book_quantity
from book_cart c, book b, book_saled_price s
where c.book_isbn = s.book_isbn and c.book_isbn = b.book_isbn and c.user_id = 'pjy7814';

--�� ���� �ݾ�
create view book_total_price
as select c.user_id, sum(c.book_quantity) as total_amount, 
    sum(s.book_saled_price * c.book_quantity) as book_total_price
from book_cart c, book_saled_price s
where s.book_isbn = c.book_isbn
group by c.user_id;

drop view book_total_price;

select * from book_total_price
where user_id = 'pjy7814';

-- ���ϸ��� ������ view ����
create view mileage_price
as select user_id, book_total_price * 0.05 as mileage_price -- 5% ����
from book_total_price;

select * from mileage_price;
drop view mileage_price;

select * from mileage;

-- ������ �� ���ϸ��� Ȯ��
create view total_mileage
as select sum(mil_price) as total_mileage, user_id
from mileage
group by user_id;

select * from total_mileage;

select * from mileage;
update mileage
set mil_total = (
    select total_mileage
    from total_mileage);

drop view total_mileage;

--å ����
insert into payment_info(payment_method, payment_date, payment_total, user_id)
values ('�ſ�ī��', '20201126', (
            select book_total_price
            from book_total_price
            where user_id = 'pjy7814'),
            'pjy7814');              
--���ϸ��� ����
insert into mileage(user_id, mil_price, mil_date)
values('pjy7814', 
    (select mileage_price 
    from mileage_price
    where user_id = 'pjy7814'), systimestamp);

update users
set mil_total = (
    select total_mileage
    from total_mileage)
where user_id = 'pjy7814';

update users
set user_total = user_total + (
            select book_total_price
            from book_total_price
            where user_id = 'pjy7814')
where user_id = 'pjy7814';

delete
from book_cart
where user_id = 'pjy7814';

select * from users;
update users
set rating_num_order = rating_num_order + 1
where user_id = 'pjy7814'; -- ���� �Ǽ� ����

Commit 
-- Ʈ������
rollback

select * from users;
rollback 

select * from users;
select * from book_cart;
select * from payment_info;
select * from mileage;
delete payment_info;
