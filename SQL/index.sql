--인덱스 생성
create index USERS_IDX on users(user_name);

DROP INDEX USERS_IDX;


--인덱스 확인하기
SELECT INDEX_NAME, INITIAL_EXTENT, DISTINCT_KEYS, NUM_ROWS, SAMPLE_SIZE, lAST_ANALYZED
FROM USER_INDEXES
WHERE INDEX_NAME = 'USERS_IDX';


--인덱스 시간 측정하기

create index book_idx on book(book_title);


SET TIMING on;
SELECT * FROM USERS WHERE USER_id='pjy7814';

SET TIMING on;
SELECT * FROM book WHERE book_title='해리 포터와 죽음의 성물';

SET TIMING ON
SELECT * FROM USERS WHERE user_id = 'SDJ8GHIU8W';