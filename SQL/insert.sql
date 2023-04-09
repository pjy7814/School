--user rating 
insert into customer_rating (rating_name, rating_num_order, rating_order_price)
select 'WELCOME', 0, 0 from dual union all
select 'FAMILY', 1, 30000 from dual union all
select 'VIP', 3, 300000 from dual union all
select 'VVIP', 20, 1000000 from dual;

select * from customer_rating;

--user 데이터
INSERT INTO USERS (user_id, user_pw, user_name,user_social_security_num,user_address,user_phone, rating_name, rating_num_order,user_total)
select 'pjy7814', 'pjy0619!!', '박지영', '0006194111111', '경기도 수원시 원천동 광교호수공원로 277 103-4306', '01045550943','VIP', 3, 670000 from dual union all
select 'jyp0518', 'jyp0518$$', '영지박', '0005183222221', '경기도 용인시 수지구 상현동', '01080190943', 'WELCOME', 0, 0 from dual union all
select 'gwaaaaakr', '1q2w3e4r5t', '곽규철', '8008135689201', '인천시 계양구 작전1동' , '01033567435', 'VIP', 5, 548000 from dual union all
select 'saidakin7', '123456qwer', '윤지민', '0007315384923', '인천시 계양구 작전1동' ,'01012449382','FAMILY', 1,48000 from dual union all
select 'khk91ep', 'wlqrkrhtlvek', '권혜경', '0010112098776', '서울특별시 마포구 서교동 양화로 165', '01012345678','FAMILY', 2,30700 from dual union all
select 'ghdrlfehd', 'eocndtkfwk', '홍길동', '6712141010100', '전라남도 장성군 황룡면 홍길동로 431', '01098765432', 'VIP', 10,987000 from dual union all
select 'anjgkwl45', 'zkvpdlscndwjs66', '길바닥', '1211182657964', '서울특별시 강남구 삼성1동 영동대로 517', '0107876987', 'WELCOME', 0,0 from dual union all
select 'knh0418', 'dkdlelajgo', '김나형', '9904182417123', '수원시 팔달구 화서2동' ,'01088134378', 'VVIP', 24, 1578900 from dual union all
select 'idididid', 'pwpwpwpw', '김이박', '0001014111111', '서울시 강남구 개포동' ,'01011111111','FAMILY', 1,70000 from dual union all
select 'lghgdh', 'dlsxjvkzm', '이기형', '7608041524692', '서울시 강남구 삼성로 512' ,'01022081578', 'FAMILY', 2,65000 from dual union all
select 'hsheo', 'rytnslaWkd', '허훈식', '8102061234567', '경기도 시흥시 산기대학로 237' ,'01052528282', 'VVIP', 50, 2300000 from dual;

select * from users;
delete users;

-- goods 데이터
insert into GOODS(goods_id, goods_name, goods_delivery_price, goods_fixed_price)
select '6973859260','도트가디건',0,33900 from dual union all
select '7687060409','위닉스 올바른 가습기',0,140000 from dual union all
select '7148919777','로즈몽 여성용 메탈시계',2000,408000 from dual union all
select '5925021687','르젠보카시 3단배색 집업 니트가디건',2500,31800 from dual union all
select '7596432879','QCY T10 블루투스5.0 무선이어폰',2500,33500 from dual union all
select '7560603555','MONTBLANC 몽블랑 126054 사토리얼 클러치 블랙',0,720000 from dual union all
select '7500816627','유미상사 수능샤프',2500,1000 from dual union all
select '7458286620','캐논 구스 롱패딩',2500,270000 from dual;

select * from goods;

--책 카테고리 데이터
insert into genre(genre_id, genre_name)
select 1, '소설' from dual union all
select 2, '시,에세이' from dual union all
select 3, '경제경영' from dual union all
select 4, '자기계발' from dual union all
select 5, '사회과학' from dual union all
select 6, '자연과학' from dual union all
select 7, '역사문학' from dual union all
select 8, '유아' from dual union all
select 9, '예술' from dual union all
select 10, '종교' from dual;

select * from genre;

--책 정보 데이터
insert into book(book_isbn, book_title, book_fixed_price, book_author, book_publisher, genre_id)
select 9791190991070, '바이러스 X', 15800, '김진명', '이타북스', 1 from dual union all
select 9788954675987, '일인칭 단수', 14500, '무라카미 하루키', '문학동네', 1 from dual union all
select 9788901245713, '위기의 시대, 돈의 미래', 17500, '짐 로저스', '리더스북', 3 from dual union all
select 9788963723310, '쓰레기 거절하기', 15000, '산드라 크라우트바슐', '양철북', 5 from dual;

select * from book;

--album데이터
insert into album (album_id, album_title, album_artist, album_genre, album_release_date, album_fixed_price)
select 'L200001955', 'Love, poem', 'IU', '가요', '2020-10-28', 43800 from dual union all
select 'DW31574', 'Positions', 'Ariana Grande', '팝', '2020-11-25', 18200 from dual union all
select 'SMK1102', 'Purpose', '태연', '가요', '2019-10-28', 21100 from dual union all
select 'DU42213', 'ROOM WITH A VIEW', '이루마', '클래식', '2020-05-28', 29300 from dual union all
SELECT 'DUK1211', 'SCENE#1', 'LA POEM', '클래식', '2020-12-21', 22000 from dual union all
SELECT 'VDCD6806', 'ㅇㅇㅇ', '안예은', '가요', '2020-02-25', 48600 from dual union all
SELECT 'INT0208', 'Ordinary Days', '딕펑스', '가요', '2020-11-30', 22000 from dual union all
select 'BMGOD3332', 'Best Of The Best3', 'Various Artist', '팝', '2003-09-25', 16500 from dual union all
SELECT 'VLCD6128', 'My Favorite Songs', '김호중', '클래식', '2020-12-10', 18300 from dual union all
select 'I1257752', 'Future Nostalgia', 'Dua Lipa', '팝', '2020-12-11', 31500 from dual;

select * from album;

--티켓 데이터
INSERT INTO ticket(ticket_reservation_num, ticket_delivery, user_id, performance_num, seat_num)
select 20201116, 1, 'pjy7814', 1000, '1층 B구역 1열 1' from dual union all
select 20201117, 0, 'pjy7814', 1000, '1층 B구역 1열 2' from dual union all
select 20201118, 1, 'gwaaaaakr', 1000, '1층 c구역 7열 7' from dual union all
select 20201119, 1, 'hsheo', 1002, '1층 A구역 6열 7' from dual union all
select 20201120, 0, 'jyp0518', 100101, '1층 B구역 1열 4' from dual;

select * from ticket;

--공연 데이터
INSERT INTO PERFORMANCE (performance_num,performance_name,performance_artist,performance_place,performance_sort,performance_rating,performance_info, performance_date, performance_time)
SELECT 1000, '노페르담 드 파리', '안젤로 델 베키오, 조제 뒤프르, 엘하이다 다니', '블루스퀘어 인터파크홀', '뮤지컬', 8, '프렌치 오리지널 내한', '20201202','20시 00분' from dual union all
select 100101, '자우림 단독 콘서트', '자우림', '올림픽공원 올림픽홀', '콘서트', 8, '잎새에 적은 노래', '20210129', '20시 00분' from dual union all
select 1002, '3개의 라흐마니노프 피아노 협주곡', '이비람 라이케르트, 피터 오브차로프', '예술의전당 콘서트홀', '클래식/오페라', 8, '명품 러시아 피아노 협주곡 시리즈', '20201122', '17시 00분' from dual union all
select 1003, '뮤지컬 <명성황후>', '김소현, 신영숙, 강필석','예술의전당 오페라극장', '뮤지컬', 8, '25주년 기념 공연', '20210106', '20시 00분' from dual union all
select 100102, '자우림 단독 콘서트', '자우림', '올림픽공원 올림픽홀', '콘서트', 8, '잎새에 적은 노래', '20210130', '18시 00분' from dual union all
select 1004, 'THE BOYZ FAN-CON 〈THE FILM FESTIVAL〉', '더보이즈', '온라인', '콘서트', 0, '온라인 티켓 (12/5)', '20201205','20시 00분' from dual;

select * from performance;

delete from performance;

INSERT INTO SEAT (performance_num,seat_num,seat_class,seat_empty,seat_price)
SELECT 1000, '1층 B구역 1열 1', 'R', 1, 135000 from dual union all
SELECT 1000, '1층 B구역 1열 2', 'R', 1, 135000 from dual union all
SELECT 1000, '1층 A구역 7열 15', 'R', 0, 135000 from dual union all
SELECT 1000, '1층 c구역 7열 7', 'R', 1, 135000 from dual union all
SELECT 1000, '1층 D구역 15열 4', 'S', 1, 99000 from dual union all
SELECT 1000, '1층 D구역 20열 8', 'A', 1, 65000 from dual union all
SELECT 100101, '1층 A구역 7열 15', 'R', 0, 125000 from dual union all
SELECT 100101, '1층 B구역 1열 4', 'R', 1, 125000 from dual union all
SELECT 100101, '1층 B구역 1열 1', 'R', 0, 125000 from dual union all
SELECT 1002, '1층 A구역 6열 7', 'R', 1, 129000 from dual union all
SELECT 1003, '1층 B구역 1열 1', 'R', 0, 129000 from dual union all
select 1004, '온라인', '일반', 0, 39000 from dual;

select * from seat;
