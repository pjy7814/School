--�ε��� ����
create index USERS_IDX on users(user_name);

DROP INDEX USERS_IDX;


--�ε��� Ȯ���ϱ�
SELECT INDEX_NAME, INITIAL_EXTENT, DISTINCT_KEYS, NUM_ROWS, SAMPLE_SIZE, lAST_ANALYZED
FROM USER_INDEXES
WHERE INDEX_NAME = 'USERS_IDX';


--�ε��� �ð� �����ϱ�

create index book_idx on book(book_title);


SET TIMING on;
SELECT * FROM USERS WHERE USER_id='pjy7814';

SET TIMING on;
SELECT * FROM book WHERE book_title='�ظ� ���Ϳ� ������ ����';

SET TIMING ON
SELECT * FROM USERS WHERE user_id = 'SDJ8GHIU8W';