--장바구니
-- 상품을 장바구니에 담기
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

-- 원하는 아이디의 장바구니에 있는 상품 정보 출력
select c.cart_no,u.user_name,g.goods_name,g.goods_fixed_price,g.goods_delivery_price
from cart c
inner join users u on c.user_ID=u.user_ID
inner join goods g on c.goods_ID = g.goods_ID
where c.user_ID =(
select u.user_ID
from users u
where u.user_name='곽규철');

-- 곽규철의 장바구니 총 금액 뷰 (배달비 추가, 개수 고려)
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

-- 결제정보 --
-- 결제정보 입력, 주문번호 생성 
insert into payment_info(user_id,payment_method,payment_date,payment_total)
select 'gwaaaaakr','신용카드','20200727',(select T.TGP from total_goods_price T where user_id='gwaaaaakr') from dual union all
select 'knh0418', '무통장입금','20180911',(select T.TGP from total_goods_price T where user_id='knh0418')  from dual union all
select 'anjgkwl45','신용카드','20201222',(select T.TGP from total_goods_price T where user_id='anjgkwl45')  from dual union all
select 'ghdrlfehd', '카카오페이','20181113',(select T.TGP from total_goods_price T where user_id='ghdrlfehd')  from dual union all
select 'khk91ep','무통장입금','20151211',(select T.TGP from total_goods_price T where user_id='khk91ep')  from dual;

select *
from payment_info;


-- 결제 후 상태
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


-- 상품 --
--현재 판매하고 있는 상품의 이름 출력
select goods_name
from goods;

-- 조회하고자하는 상품의 정보 출력
select goods_ID, goods_name, goods_delivery_price, goods_fixed_price
from goods
where goods_id ='6973859260';

-- 가격이 (40000)원 이하이고, 상품명에 '가디건'이 들어가는 상품 출력
select goods_name, goods_delivery_price,goods_fixed_price
from goods
where goods_fixed_price <=40000 and goods_name like '%가디건%' and goods_delivery_price = 0 ;

-- 판매하고있는 상품의 가격낮은순 출력
select goods_name,goods_fixed_price
from goods
order by goods_fixed_price;



-- 리뷰 --
-- 고객이 상품의 리뷰를 작성
insert into review(user_ID,order_num ,goods_ID,review_registration_date,review_rating,review_content)
select 'gwaaaaakr',(select P.order_num from payment_info P where user_id='gwaaaaakr'),'7596432879', '20200731152301', 5, '고양이가 뜯어먹을 선이 없어서 좋아요 ^^' from dual union all
select 'knh0418',(select P.order_num from payment_info P where user_id='knh0418') ,'7500816627', '20180912203211', 4, '이만한  샤프 또 없읍니다. 그치만 디자인이 구립니다.' from dual union all
select 'anjgkwl45',(select P.order_num from payment_info P where user_id='anjgkwl45'),'7687060409', '20201225070812',1,'우리집 고양님이 이것만 보면 하악질해요;;' from dual union all
select 'khk91ep',(select P.order_num from payment_info P where user_id='khk91ep'),'7458286620','20151213111111',5, '바닥에 던져둔 롱패딩 팔에서 우리 고영님 나왔어요 짱' from dual union all
select 'ghdrlfehd', (select P.order_num from payment_info P where user_id='ghdrlfehd'),'7500816627', '20181120183345', 3, '이 샤프를 쓰고 수능 백점 맞았어요'  from dual union all
select 'ghdrlfehd',(select P.order_num from payment_info P where user_id='ghdrlfehd') ,'7687060409', '20190524125701', 5, '오늘부터 코막힘없이 잘수있겠네요^^' from dual;


select *
from review;

-- 고객이 작성한 리뷰를 검색
select *
from review r
where r.user_id=(
select u.user_ID
from users u
where u.user_name='곽규철'); 

-- 선택한 상품의 리뷰 내용을 별점 높은 순(추천순)으로 출력
select user_ID,review_content ,review_rating, review_registration_date
from review 
where r.goods_id = '7500816627'
order by review_rating desc;

-- 선택한 상품의 리뷰 내용을 최신순으로 출력
select user_ID,review_content ,review_rating, review_registration_date
from review 
where goods_id = '7500816627'
order by review_registration_date desc;