--Ƽ�� �����ϱ�
insert into payment_info(payment_method, payment_date, payment_total, user_id)
values ('�������Ա�', '20201120', (
            select seat_price
            from ticket_price
            where ticket_reservation_num=20201120),
            'jyp0518');
update users
set rating_num_order = rating_num_order + 1
where user_id = 'jyp0518'; -- ���� �Ǽ� ����
Commit; -- Ʈ������

select * from payment_info;







--������ Ƽ�Ϻ�
create view ticket_price
as select t.ticket_reservation_num, t.ticket_delivery, user_id, t.performance_num, t.seat_num,s.seat_price
from ticket t, seat s
where t.performance_num=s.performance_num and t.seat_num=s.seat_num;

select * from ticket_price;
drop view ticket_price;



--���̵� ���� ��������
SELECT user_id, ticket_reservation_num, performance_name, performance_date, performance_time
FROM TICKET T, performance p
where t.performance_num=p.performance_num
    and user_id='pjy7814';
    
--���� ������
SELECT distinct performance_sort, performance_name, performance_artist
FROM PERFORMANCE;

--������ ��
SELECT distinct performance_place, performance_name, performance_artist
FROM PERFORMANCE;

--������ ���� Ȯ��
select distinct p.performance_name, u.user_name, u.user_phone,s.seat_num
FROM TICKET t, performance p, seat s, users u
where p.performance_num=1000 and u.user_id=t.user_id and p.performance_num=t.performance_num and t.seat_num=s.seat_num
order by seat_num;

--���Ź�ȣ�� ���� �¼� Ȯ��
SELECT t.ticket_reservation_num, user_name, p.performance_date, p.performance_time, p.performance_artist, p.performance_place, s.seat_num
FROM TICKET t, performance p, seat s, users u
where t.ticket_reservation_num=20201119 and u.user_id=t.user_id and p.performance_num=t.performance_num and t.seat_num=s.seat_num;

--������ȣ�� �� �ڸ� ã��
select p.performance_name, s.seat_num, s.seat_class, s.seat_empty, s.seat_price
from performance p, seat s
where p.performance_num=s.performance_num and s.performance_num=1000 and s.seat_empty=0;

--�������̸����� �˻��ϱ�
select performance_name, performance_artist, performance_place, performance_date, performance_time
from performance
where performance_artist='�ڿ츲';
