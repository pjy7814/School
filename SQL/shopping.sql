--��ٱ���
-- ��ǰ�� ��ٱ��Ͽ� ���
insert into cart(user_id,goods_id,cart_quantity)
select 'gwaaaaakr','6973859260', 1 from dual union all
select 'gwaaaaakr','7596432879', 2 from dual union all
select 'knh0418', '7500816627', 1 from dual union all
select 'anjgkwl45','7687060409', 1 from dual union all
select 'ghdrlfehd', '7687060409', 1 from dual union all
select 'ghdrlfehd', '7500816627', 3 from dual union all
select 'khk91ep','7458286620', 1 from dual;

select *
from cart;

-- ���ϴ� ���̵��� ��ٱ��Ͽ� �ִ� ��ǰ ���� ���
select c.cart_no,u.user_name,g.goods_name,g.goods_fixed_price,g.goods_delivery_price
from cart c
inner join users u on c.user_ID=u.user_ID
inner join goods g on c.goods_ID = g.goods_ID
where c.user_ID =(
select u.user_ID
from users u
where u.user_name='����ö');

-- ����ö�� ��ٱ��� �� �ݾ� �� (��޺� �߰�, ���� ���)
CREATE VIEW total_goods_price
as
select c.user_id , sum(g.goods_fixed_price * c.cart_quantity + g.goods_delivery_price) as TGP
from cart c 
inner join users u on c.user_ID=u.user_ID
inner join goods g on c.goods_ID = g.goods_ID
group by c.user_id;

select * from total_goods_price;
select * from total_goods_price where user_id='gwaaaaakr';
drop view total_goods_price;

-- �������� --
-- �������� �Է�, �ֹ���ȣ ���� 
insert into payment_info(user_id,payment_method,payment_date,payment_total)
select 'gwaaaaakr','�ſ�ī��','20200727',(select T.TGP from total_goods_price T where user_id='gwaaaaakr') from dual union all
select 'knh0418', '�������Ա�','20180911',(select T.TGP from total_goods_price T where user_id='knh0418')  from dual union all
select 'anjgkwl45','�ſ�ī��','20201222',(select T.TGP from total_goods_price T where user_id='anjgkwl45')  from dual union all
select 'ghdrlfehd', 'īī������','20181113',(select T.TGP from total_goods_price T where user_id='ghdrlfehd')  from dual union all
select 'khk91ep','�������Ա�','20151211',(select T.TGP from total_goods_price T where user_id='khk91ep')  from dual;

select *
from payment_info;


-- ���� �� ����
delete
from cart
where user_id = 'gwaaaaakr';

update users
set rating_num_order = rating_num_order + 1
where user_id = 'gwaaaaakr';
commit;

select user_name,rating_name,rating_num_order
from users
where user_id = 'gwaaaaakr';

select *
from cart;


-- ��ǰ --
--���� �Ǹ��ϰ� �ִ� ��ǰ�� �̸� ���
select goods_name
from goods;

-- ��ȸ�ϰ����ϴ� ��ǰ�� ���� ���
select goods_ID, goods_name, goods_delivery_price, goods_fixed_price
from goods
where goods_id ='6973859260';

-- ������ (40000)�� �����̰�, ��ǰ�� '�����'�� ���� ��ǰ ���
select goods_name, goods_delivery_price,goods_fixed_price
from goods
where goods_fixed_price <=40000 and goods_name like '%�����%' and goods_delivery_price = 0 ;

-- �Ǹ��ϰ��ִ� ��ǰ�� ���ݳ����� ���
select goods_name,goods_fixed_price
from goods
order by goods_fixed_price;



-- ���� --
-- ���� ��ǰ�� ���並 �ۼ�
insert into review(user_ID,order_num ,goods_ID,review_registration_date,review_rating,review_content)
select 'gwaaaaakr',(select P.order_num from payment_info P where user_id='gwaaaaakr'),'7596432879', '20200731152301', 5, '����̰� ������ ���� ��� ���ƿ� ^^' from dual union all
select 'knh0418',(select P.order_num from payment_info P where user_id='knh0418') ,'7500816627', '20180912203211', 4, '�̸���  ���� �� �����ϴ�. ��ġ�� �������� �����ϴ�.' from dual union all
select 'anjgkwl45',(select P.order_num from payment_info P where user_id='anjgkwl45'),'7687060409', '20201225070812',1,'�츮�� ������ �̰͸� ���� �Ͼ����ؿ�;;' from dual union all
select 'khk91ep',(select P.order_num from payment_info P where user_id='khk91ep'),'7458286620','20151213111111',5, '�ٴڿ� ������ ���е� �ȿ��� �츮 ���� ���Ծ�� ¯' from dual union all
select 'ghdrlfehd', (select P.order_num from payment_info P where user_id='ghdrlfehd'),'7500816627', '20181120183345', 3, '�� ������ ���� ���� ���� �¾Ҿ��'  from dual union all
select 'ghdrlfehd',(select P.order_num from payment_info P where user_id='ghdrlfehd') ,'7687060409', '20190524125701', 5, '���ú��� �ڸ������� �߼��ְڳ׿�^^' from dual;


select *
from review;

-- ���� �ۼ��� ���並 �˻�
select *
from review r
where r.user_id=(
select u.user_ID
from users u
where u.user_name='����ö'); 

-- ������ ��ǰ�� ���� ������ ���� ���� ��(��õ��)���� ���
select user_ID,review_content ,review_rating, review_registration_date
from review 
where r.goods_id = '7500816627'
order by review_rating desc;

-- ������ ��ǰ�� ���� ������ �ֽż����� ���
select user_ID,review_content ,review_rating, review_registration_date
from review 
where goods_id = '7500816627'
order by review_registration_date desc;