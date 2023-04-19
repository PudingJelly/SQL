-- insert
-- 테이블 구조 확인
DESC departments; --describe
-- NOT NULL => NULL값이 들어갈 수 없다라는 뜻

-- insert 첫번째 방법 (모든 컬럼 데이터를 한 번에 지정)
INSERT INTO departments
VALUES(290, '영업부');

SELECT * FROM departments;
ROLLBACK; -- 실행 시점을 다시 뒤로 되돌리는 키워드

-- insert의 두번째 방법 (직접 컬럼을 지정하고 저장, NOT NULL 확인하세요!)
INSERT INTO departments
    (department_id, department_name, location_id )
VALUES
    (280, '개발자', 1700);

-- 사본 테이블 생성
-- 사본 테이블을 생성할 때 그냥 생성하면 -> 조회된 데이터까지 모두 복사
-- WHERE절에 false값 (1 = 2) 지정하면 -> 테이블의 구조만 복사하고 데이터는 복사X
CREATE TABLE managers AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM managers;
DROP TABLE managers;

-- insert (서브쿼리)
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

/*
CTAS를 사용하면 제약 조건은 NOT NULL 말고는 복사되지 않습니다.
제약조건은 업무 규칙을 지키는 데이터만 저장하고, 그렇지 않은 것들이 
DB에 저장되는 것을 방지하는 목적으로 사용합니다.
*/

--------------------------------------------------------------------------------

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;

-- UPDATE를 진행할 때는 누구를 수정할 지 잘 지목해야 합니다.
-- 그렇지 않으면 수정 대상이 테이블 전체로 지목됩니다.
UPDATE emps SET salary = 30000;
SELECT * FROM emps;
ROLLBACK;

UPDATE emps SET salary = 30000 
WHERE employee_id = 100;

UPDATE emps SET salary = salary + salary * 0.1
WHERE employee_id = 100;

UPDATE emps 
SET phone_number = '010-1234-5678',manager_id = 102
WHERE employee_id = 100;

UPDATE emps
    SET (job_id, salary, manager_id) = 
    (SELECT job_id, salary, manager_id
    FROM emps
    WHERE employee_id = 100 
    )
WHERE employee_id = 101;

-- DELETE
DELETE FROM emps
WHERE employee_id = 103;
SELECT * FROM emps;
ROLLBACK;

--사본테이블 생성
CREATE TABLE depts AS (SELECT * FROM departments);
SELECT * FROM depts;

-- DELETE (서브쿼리)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM depts
                        WHERE department_name = 'IT');
                                