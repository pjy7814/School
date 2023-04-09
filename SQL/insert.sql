--user rating 
insert into customer_rating (rating_name, rating_num_order, rating_order_price)
select 'WELCOME', 0, 0 from dual union all
select 'FAMILY', 1, 30000 from dual union all
select 'VIP', 3, 300000 from dual union all
select 'VVIP', 20, 1000000 from dual;

select * from customer_rating;

--user ������
INSERT INTO USERS (user_id, user_pw, user_name,user_social_security_num,user_address,user_phone, rating_name, rating_num_order,user_total)
select 'pjy7814', 'pjy0619!!', '������', '0006194111111', '��⵵ ������ ��õ�� ����ȣ�������� 277 103-4306', '01045550943','VIP', 3, 670000 from dual union all
select 'jyp0518', 'jyp0518$$', '������', '0005183222221', '��⵵ ���ν� ������ ������', '01080190943', 'WELCOME', 0, 0 from dual union all
select 'gwaaaaakr', '1q2w3e4r5t', '����ö', '8008135689201', '��õ�� ��籸 ����1��' , '01033567435', 'VIP', 5, 548000 from dual union all
select 'saidakin7', '123456qwer', '������', '0007315384923', '��õ�� ��籸 ����1��' ,'01012449382','FAMILY', 1,48000 from dual union all
select 'khk91ep', 'wlqrkrhtlvek', '������', '0010112098776', '����Ư���� ������ ������ ��ȭ�� 165', '01012345678','FAMILY', 2,30700 from dual union all
select 'ghdrlfehd', 'eocndtkfwk', 'ȫ�浿', '6712141010100', '���󳲵� �强�� Ȳ��� ȫ�浿�� 431', '01098765432', 'VIP', 10,987000 from dual union all
select 'anjgkwl45', 'zkvpdlscndwjs66', '��ٴ�', '1211182657964', '����Ư���� ������ �Ｚ1�� ������� 517', '0107876987', 'WELCOME', 0,0 from dual union all
select 'knh0418', 'dkdlelajgo', '�質��', '9904182417123', '������ �ȴޱ� ȭ��2��' ,'01088134378', 'VVIP', 24, 1578900 from dual union all
select 'idididid', 'pwpwpwpw', '���̹�', '0001014111111', '����� ������ ������' ,'01011111111','FAMILY', 1,70000 from dual union all
select 'lghgdh', 'dlsxjvkzm', '�̱���', '7608041524692', '����� ������ �Ｚ�� 512' ,'01022081578', 'FAMILY', 2,65000 from dual union all
select 'hsheo', 'rytnslaWkd', '���ƽ�', '8102061234567', '��⵵ ����� �����з� 237' ,'01052528282', 'VVIP', 50, 2300000 from dual;

select * from users;
delete users;

-- goods ������
insert into GOODS(goods_id, goods_name, goods_delivery_price, goods_fixed_price)
select '6973859260','��Ʈ�����',0,33900 from dual union all
select '7687060409','���н� �ùٸ� ������',0,140000 from dual union all
select '7148919777','����� ������ ��Ż�ð�',2000,408000 from dual union all
select '5925021687','������ī�� 3�ܹ�� ���� ��Ʈ�����',2500,31800 from dual union all
select '7596432879','QCY T10 �������5.0 �����̾���',2500,33500 from dual union all
select '7560603555','MONTBLANC ����� 126054 ���丮�� Ŭ��ġ ��',0,720000 from dual union all
select '7500816627','���̻�� ���ɻ���',2500,1000 from dual union all
select '7458286620','ĳ�� ���� ���е�',2500,270000 from dual;

select * from goods;

--å ī�װ� ������
insert into genre(genre_id, genre_name)
select 1, '�Ҽ�' from dual union all
select 2, '��,������' from dual union all
select 3, '�����濵' from dual union all
select 4, '�ڱ���' from dual union all
select 5, '��ȸ����' from dual union all
select 6, '�ڿ�����' from dual union all
select 7, '���繮��' from dual union all
select 8, '����' from dual union all
select 9, '����' from dual union all
select 10, '����' from dual;

select * from genre;

--å ���� ������
insert into book(book_isbn, book_title, book_fixed_price, book_author, book_publisher, genre_id)
select 9791190991070, '���̷��� X', 15800, '������', '��Ÿ�Ͻ�', 1 from dual union all
select 9788954675987, '����Ī �ܼ�', 14500, '����ī�� �Ϸ�Ű', '���е���', 1 from dual union all
select 9788901245713, '������ �ô�, ���� �̷�', 17500, '�� ������', '��������', 3 from dual union all
select 9788963723310, '������ �����ϱ�', 15000, '���� ũ���Ʈ�ٽ�', '��ö��', 5 from dual;

select * from book;

--album������
insert into album (album_id, album_title, album_artist, album_genre, album_release_date, album_fixed_price)
select 'L200001955', 'Love, poem', 'IU', '����', '2020-10-28', 43800 from dual union all
select 'DW31574', 'Positions', 'Ariana Grande', '��', '2020-11-25', 18200 from dual union all
select 'SMK1102', 'Purpose', '�¿�', '����', '2019-10-28', 21100 from dual union all
select 'DU42213', 'ROOM WITH A VIEW', '�̷縶', 'Ŭ����', '2020-05-28', 29300 from dual union all
SELECT 'DUK1211', 'SCENE#1', 'LA POEM', 'Ŭ����', '2020-12-21', 22000 from dual union all
SELECT 'VDCD6806', '������', '�ȿ���', '����', '2020-02-25', 48600 from dual union all
SELECT 'INT0208', 'Ordinary Days', '���㽺', '����', '2020-11-30', 22000 from dual union all
select 'BMGOD3332', 'Best Of The Best3', 'Various Artist', '��', '2003-09-25', 16500 from dual union all
SELECT 'VLCD6128', 'My Favorite Songs', '��ȣ��', 'Ŭ����', '2020-12-10', 18300 from dual union all
select 'I1257752', 'Future Nostalgia', 'Dua Lipa', '��', '2020-12-11', 31500 from dual;

select * from album;

--Ƽ�� ������
INSERT INTO ticket(ticket_reservation_num, ticket_delivery, user_id, performance_num, seat_num)
select 20201116, 1, 'pjy7814', 1000, '1�� B���� 1�� 1' from dual union all
select 20201117, 0, 'pjy7814', 1000, '1�� B���� 1�� 2' from dual union all
select 20201118, 1, 'gwaaaaakr', 1000, '1�� c���� 7�� 7' from dual union all
select 20201119, 1, 'hsheo', 1002, '1�� A���� 6�� 7' from dual union all
select 20201120, 0, 'jyp0518', 100101, '1�� B���� 1�� 4' from dual;

select * from ticket;

--���� ������
INSERT INTO PERFORMANCE (performance_num,performance_name,performance_artist,performance_place,performance_sort,performance_rating,performance_info, performance_date, performance_time)
SELECT 1000, '���丣�� �� �ĸ�', '������ �� ��Ű��, ���� ������, �����̴� �ٴ�', '��罺���� ������ũȦ', '������', 8, '����ġ �������� ����', '20201202','20�� 00��' from dual union all
select 100101, '�ڿ츲 �ܵ� �ܼ�Ʈ', '�ڿ츲', '�ø��Ȱ��� �ø���Ȧ', '�ܼ�Ʈ', 8, '�ٻ��� ���� �뷡', '20210129', '20�� 00��' from dual union all
select 1002, '3���� ���帶�ϳ��� �ǾƳ� ���ְ�', '�̺�� �����ɸ�Ʈ, ���� ����������', '���������� �ܼ�ƮȦ', 'Ŭ����/�����', 8, '��ǰ ���þ� �ǾƳ� ���ְ� �ø���', '20201122', '17�� 00��' from dual union all
select 1003, '������ <��Ȳ��>', '�����, �ſ���, ���ʼ�','���������� ��������', '������', 8, '25�ֳ� ��� ����', '20210106', '20�� 00��' from dual union all
select 100102, '�ڿ츲 �ܵ� �ܼ�Ʈ', '�ڿ츲', '�ø��Ȱ��� �ø���Ȧ', '�ܼ�Ʈ', 8, '�ٻ��� ���� �뷡', '20210130', '18�� 00��' from dual union all
select 1004, 'THE BOYZ FAN-CON ��THE FILM FESTIVAL��', '��������', '�¶���', '�ܼ�Ʈ', 0, '�¶��� Ƽ�� (12/5)', '20201205','20�� 00��' from dual;

select * from performance;

delete from performance;

INSERT INTO SEAT (performance_num,seat_num,seat_class,seat_empty,seat_price)
SELECT 1000, '1�� B���� 1�� 1', 'R', 1, 135000 from dual union all
SELECT 1000, '1�� B���� 1�� 2', 'R', 1, 135000 from dual union all
SELECT 1000, '1�� A���� 7�� 15', 'R', 0, 135000 from dual union all
SELECT 1000, '1�� c���� 7�� 7', 'R', 1, 135000 from dual union all
SELECT 1000, '1�� D���� 15�� 4', 'S', 1, 99000 from dual union all
SELECT 1000, '1�� D���� 20�� 8', 'A', 1, 65000 from dual union all
SELECT 100101, '1�� A���� 7�� 15', 'R', 0, 125000 from dual union all
SELECT 100101, '1�� B���� 1�� 4', 'R', 1, 125000 from dual union all
SELECT 100101, '1�� B���� 1�� 1', 'R', 0, 125000 from dual union all
SELECT 1002, '1�� A���� 6�� 7', 'R', 1, 129000 from dual union all
SELECT 1003, '1�� B���� 1�� 1', 'R', 0, 129000 from dual union all
select 1004, '�¶���', '�Ϲ�', 0, 39000 from dual;

select * from seat;
