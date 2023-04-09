--총 결제 금액 확인
create view sum_total
as select sum(payment_total) as sum_total, p.user_id
    from payment_info p, users u
    where p.user_id = u.user_id
    group by p.user_id;

select * from sum_total;
drop view sum_total;

--유저 등급
update users
set rating_name = 'FAMILY'
where rating_num_order >= (
    select rating_num_order
    from customer_rating
    where rating_name = 'FAMILY') and 
    user_total >= (
    select rating_order_price
    from customer_rating
    where rating_name = 'FAMILY');

update users
set rating_name = 'VIP'
where rating_num_order >= (
    select rating_num_order
    from customer_rating
    where rating_name = 'VIP') and 
    user_total >= (
    select rating_order_price
    from customer_rating
    where rating_name = 'VIP');

update users
set rating_name = 'VVIP'
where rating_num_order >= (
    select rating_num_order
    from customer_rating
    where rating_name = 'VVIP') and 
    user_total >= (
    select rating_order_price
    from customer_rating
    where rating_name = 'VVIP');
    
select * from users;