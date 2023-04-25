
/*
trigger는 테이블에 부착된 형태로써, INSERT, UPDATE, DELETE 작업이 수행 될 때
특정 코드가 작동되도록 하는 구문입니다.
VIEW에는 부착이 불가능 합니다.

트리거를 만들 때 범위 지정하고 F5버튼으로 부분 실행 해야 합니다.
그렇지 않으면 하나의 구문으로 인식되어 정상 동작하지 않습니다.
*/

CREATE TABLE tbl_test
(
    id NUMBER(10),
    text VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER trg_test
    AFTER DELETE OR UPDATE -- 트리거의 발생 시점. (삭제 OR 수정 이후에 동작)
    ON tbl_test -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행에 모두 적용.(생략가능. 생략시 한번만 실행)
-- DECLARE는 생략 가능
BEGIN
    DBMS_OUTPUT.put_line('트리거가 동작함!'); -- 실행하고자 하는 코드를 BEGIN과 END 사이에 넣음.
END;

INSERT INTO tbl_test VALUES(1, '김철수');
UPDATE tbl_test SET text = '김뽀삐' WHERE ID = 1;
DELETE FROM tbl_test WHERE id =1;

