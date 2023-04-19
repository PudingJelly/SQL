
/*
- NUMBER(2) -> 정수를 2자리까지 저장할 수 있는 숫자형 타입.
- NUMBER(5, 2) -> 정수부, 실수부를 합친 총 자릿수 5자리, 소수점 2자리
- NUMBER -> 괄호를 생략할 시 (38, 0)으로 자동 지정됩니다.
- VARCHAR2(byte) -> 괄호안에 들어올 문자열의 최대 길이를 지정. (4000byte까지 가능)
- CLOB -> 대용량 텍스트 데이터 타입 (최대 4Gbyte
- BLOB -> 이진형 대용량 객체 (이미지, 파일 저장 시 사용)
- DATE -> BC 4712년 1월 1일 ~ AD 9999년 12월 31일까지 지정 가능
- 시, 분, 초 지원 가능.
*/

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);
DESC dept2;
SELECT * FROM dept2;

-- NUMBER와 VARCHAR2 타입의 길이를 확인
INSERT INTO dept2
VALUES(30, '경영지원', '서울', sysdate, 2000000000);

-- 컬럼 추가
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

-- 열 이름 변경
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;

-- 열 속성 수정
ALTER TABLE dept2
MODIFY(dept_name VARCHAR2(20));

DESC dept2;

-- 변경하고자 하는 컬럼에 데이터가 이미 들어가 있으면 다른 타입으로 변경이 불가능함
-- 그에 맞는 타입으로 변경해야함
ALTER TABLE dept2
MODIFY(dept_name NUMBER(20)); -- 에러

-- 열 삭제
ALTER TABLE dept2
DROP COLUMN emp_count;

DESC dept2
SELECT * FROM dept2;

-- 테이블 이름 변경
ALTER TABLE dept2
RENAME TO dept3;

DESC dept3;
SELECT * FROM dept3;

-- 테이블 삭제 (구조는 남겨두고 내부 데이터만 모두 삭제)
TRUNCATE TABLE dept3;
    
SELECT * FROM dept3;

-- 테이블 전체 삭제(되돌릴 수 없음 백업 후 진행 권장)
DROP TABLE dept3;

ROLLBACK;


