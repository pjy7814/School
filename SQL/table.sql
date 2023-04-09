    -- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.
DROP TRIGGER payment_info_AI_TRG;
DROP SEQUENCE payment_info_SEQ;
DROP TRIGGER cart_AI_TRG;
DROP SEQUENCE cart_SEQ;
DROP TRIGGER book_cart_AI_TRG;
DROP SEQUENCE book_cart_SEQ;

drop table album CASCADE CONSTRAINTS;
drop table book CASCADE CONSTRAINTS;
drop table book_cart CASCADE CONSTRAINTS;
drop table cart CASCADE CONSTRAINTS;
drop table customer_rating CASCADE CONSTRAINTS;
drop table genre CASCADE CONSTRAINTS;
drop table goods CASCADE CONSTRAINTS;
drop table mileage CASCADE CONSTRAINTS;
drop table payment_info CASCADE CONSTRAINTS;
drop table per_time CASCADE CONSTRAINTS;
drop table performance CASCADE CONSTRAINTS;
drop table review CASCADE CONSTRAINTS;
drop table seat CASCADE CONSTRAINTS;
drop table ticket CASCADE CONSTRAINTS;
drop table users CASCADE CONSTRAINTS;

CREATE TABLE customer_rating
(
    rating_name           VARCHAR2(20)    NOT NULL, 
    rating_num_order      INT             NULL, 
    rating_order_price    INT             NULL, 
    CONSTRAINT CUSTOMER_RATING_PK PRIMARY KEY (rating_name)
);

CREATE TABLE users
(
    user_id                     VARCHAR2(20)     NOT NULL, 
    user_pw                     VARCHAR2(20)     NOT NULL, 
    user_name                   VARCHAR2(20)     NOT NULL, 
    user_social_security_num    VARCHAR2(20)     NOT NULL, 
    user_address                VARCHAR2(100)    NOT NULL, 
    user_phone                  VARCHAR2(20)     NOT NULL, 
    rating_name                 VARCHAR2(20)     NOT NULL, 
    rating_num_order            INT              NOT NULL, 
    user_total                  INT              NOT NULL, 
    mil_total                   INT              NULL,
    CONSTRAINT USERS_PK PRIMARY KEY (user_id)
);

ALTER TABLE users
    ADD CONSTRAINT FK_users_rating_name_customer_ FOREIGN KEY (rating_name)
        REFERENCES customer_rating (rating_name);

CREATE TABLE performance
(
    performance_num       INT              NOT NULL, 
    performance_name      VARCHAR2(100)    NOT NULL, 
    performance_artist    VARCHAR2(100)    NOT NULL, 
    performance_place     VARCHAR2(100)    NOT NULL, 
    performance_sort      VARCHAR2(20)     NOT NULL, 
    performance_rating    INT              NOT NULL, 
    performance_info      VARCHAR2(100)    NOT NULL, 
    performance_date      DATE             NOT NULL, 
    performance_time      VARCHAR2(20)     NOT NULL, 
    CONSTRAINT PERFORMANCE_PK PRIMARY KEY (performance_num)
);

CREATE TABLE goods
(
    goods_id                VARCHAR2(20)     NOT NULL, 
    goods_name              VARCHAR2(100)    NULL, 
    goods_delivery_price    INT              NULL, 
    goods_fixed_price       INT              NULL, 
    CONSTRAINT GOODS_PK PRIMARY KEY (goods_id)
);

CREATE TABLE seat
(
    performance_num    INT             NOT NULL, 
    seat_num           VARCHAR2(20)    NOT NULL, 
    seat_class         VARCHAR2(20)    NULL, 
    seat_empty         CHAR(1)         NOT NULL, 
    seat_price         INT             NOT NULL, 
    CONSTRAINT SEAT_PK PRIMARY KEY (performance_num, seat_num)
);

ALTER TABLE seat
    ADD CONSTRAINT FK_seat_performance_num_perfor FOREIGN KEY (performance_num)
        REFERENCES performance (performance_num);

CREATE TABLE genre
(
    genre_id      INT             NOT NULL, 
    genre_name    VARCHAR2(20)    NULL, 
    CONSTRAINT GENRE_PK PRIMARY KEY (genre_id)
);

CREATE TABLE book
(
    book_isbn           INT              NOT NULL, 
    book_title          VARCHAR2(100)    NULL, 
    book_fixed_price    INT              NULL, 
    book_author         VARCHAR2(50)     NULL, 
    book_publisher      VARCHAR2(20)     NULL, 
    genre_id            INT              NULL, 
    CONSTRAINT BOOK_PK PRIMARY KEY (book_isbn)
);

ALTER TABLE book
    ADD CONSTRAINT FK_book_genre_id_genre_genre_i FOREIGN KEY (genre_id)
        REFERENCES genre (genre_id);

CREATE TABLE album
(
    album_id              VARCHAR2(20)     NOT NULL, 
    album_title           VARCHAR2(100)    NOT NULL, 
    album_artist          VARCHAR2(50)     NOT NULL, 
    album_genre           VARCHAR2(20)     NOT NULL, 
    album_release_date    TIMESTAMP        NOT NULL, 
    album_fixed_price     INT              NOT NULL, 
    CONSTRAINT ALBUM_PK PRIMARY KEY (album_id)
);

CREATE TABLE payment_info
(
    order_num         INT             NOT NULL, 
    payment_method    VARCHAR2(20)    NOT NULL, 
    payment_date      INT             NOT NULL, 
    payment_total     INT             NOT NULL, 
    user_id           VARCHAR2(20)    NOT NULL, 
    CONSTRAINT PAYMENT_INFO_PK PRIMARY KEY (order_num)
);

--auto increment
CREATE SEQUENCE payment_info_SEQ
START WITH 1000000
INCREMENT BY 1;

--트리거
CREATE OR REPLACE TRIGGER payment_info_AI_TRG
BEFORE INSERT ON payment_info 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT payment_info_SEQ.NEXTVAL
    INTO :NEW.order_num
    FROM DUAL;
END;

ALTER TABLE payment_info
    ADD CONSTRAINT FK_payment_info_user_id_users_ FOREIGN KEY (user_id)
        REFERENCES users (user_id);

CREATE TABLE ticket
(
    ticket_reservation_num    INT             NOT NULL, 
    ticket_delivery           CHAR(1)         NOT NULL, 
    user_id                   VARCHAR2(20)    NOT NULL, 
    performance_num           INT             NOT NULL, 
    seat_num                  VARCHAR2(20)    NOT NULL, 
    CONSTRAINT TICKET_PK PRIMARY KEY (ticket_reservation_num)
);

ALTER TABLE ticket
    ADD CONSTRAINT FK_ticket_user_id_users_user_i FOREIGN KEY (user_id)
        REFERENCES users (user_id);

ALTER TABLE ticket
    ADD CONSTRAINT FK_ticket_seat_num_seat_seat_n FOREIGN KEY (seat_num, performance_num)
        REFERENCES seat (seat_num, performance_num);

CREATE TABLE mileage
(
    user_id         VARCHAR2(20)    NULL, 
    mil_price       INT             NOT NULL, 
    mil_date        TIMESTAMP       NOT NULL,
    CONSTRAINT MILEAGE_PK PRIMARY KEY (user_id, mil_date)
);

ALTER TABLE Mileage
    ADD CONSTRAINT FK_Mileage_user_id_users_user_ FOREIGN KEY (user_id)
        REFERENCES users (user_id);

CREATE TABLE review
(
    user_id                     VARCHAR2(20)     NOT NULL, 
    review_registration_date    TIMESTAMP        NULL, 
    review_rating               FLOAT            NULL, 
    review_content              VARCHAR2(100)    NULL, 
    goods_id                    VARCHAR2(20)     NULL, 
    order_num                   INT              NULL, 
    CONSTRAINT REVIEW_PK PRIMARY KEY (user_id, goods_id, order_num)
);

ALTER TABLE review
    ADD CONSTRAINT FK_review_user_id_users_user_i FOREIGN KEY (user_id)
        REFERENCES users (user_id);

ALTER TABLE review
    ADD CONSTRAINT FK_review_goods_id_goods_goods FOREIGN KEY (goods_id)
        REFERENCES goods (goods_id);
        
ALTER TABLE review
    ADD CONSTRAINT FK_review_order_num_payment_in FOREIGN KEY (order_num)
        REFERENCES payment_info (order_num);

CREATE TABLE cart
(
    cart_no          INT             NULL, 
    user_id          VARCHAR2(20)    NOT NULL, 
    goods_id         VARCHAR2(20)    NULL, 
    cart_quantity    INT             NOT NULL, 
    CONSTRAINT CART_PK PRIMARY KEY (cart_no, user_id)
);

CREATE SEQUENCE cart_SEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER cart_AI_TRG
BEFORE INSERT ON cart 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT cart_SEQ.NEXTVAL
    INTO :NEW.cart_no
    FROM DUAL;
END;

ALTER TABLE cart
    ADD CONSTRAINT FK_cart_goods_id_goods_goods_i FOREIGN KEY (goods_id)
        REFERENCES goods (goods_id);

ALTER TABLE cart
    ADD CONSTRAINT FK_cart_user_id_users_user_id FOREIGN KEY (user_id)
        REFERENCES users (user_id);

CREATE TABLE book_cart
(
    book_cart_no      INT             NOT NULL, 
    user_id           VARCHAR2(20)    NULL, 
    book_isbn         INT             NULL, 
    book_quantity     INT             NULL, 
    album_id          VARCHAR2(20)    NULL, 
    album_quantity    INT             NULL, 
    CONSTRAINT BOOK_CART_PK PRIMARY KEY (book_cart_no, user_id)
);

CREATE SEQUENCE book_cart_SEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER book_cart_AI_TRG
BEFORE INSERT ON book_cart 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT book_cart_SEQ.NEXTVAL
    INTO :NEW.book_cart_no
    FROM DUAL;
END;s

ALTER TABLE book_cart
    ADD CONSTRAINT FK_book_cart_book_isbn_book_bo FOREIGN KEY (book_isbn)
        REFERENCES book (book_isbn);

ALTER TABLE book_cart
    ADD CONSTRAINT FK_book_cart_album_id_album_al FOREIGN KEY (album_id)
        REFERENCES album (album_id);

ALTER TABLE book_cart
    ADD CONSTRAINT FK_book_cart_user_id_users_use FOREIGN KEY (user_id)
        REFERENCES users (user_id);


