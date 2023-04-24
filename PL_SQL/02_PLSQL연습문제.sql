
-- 1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자. (출력문 9개를 복사해서 쓰세요)

DECLARE
    emp_num NUMBER;
BEGIN
    emp_num := 3;

DBMS_OUTPUT.put_line(emp_num || ' X 1 = ' || emp_num * 1);
DBMS_OUTPUT.put_line(emp_num || ' X 2 = ' || emp_num * 2);
DBMS_OUTPUT.put_line(emp_num || ' X 3 = ' || emp_num * 3);
DBMS_OUTPUT.put_line(emp_num || ' X 4 = ' || emp_num * 4);
DBMS_OUTPUT.put_line(emp_num || ' X 5 = ' || emp_num * 5);
DBMS_OUTPUT.put_line(emp_num || ' X 6 = ' || emp_num * 6);
DBMS_OUTPUT.put_line(emp_num || ' X 7 = ' || emp_num * 7);
DBMS_OUTPUT.put_line(emp_num || ' X 8 = ' || emp_num * 8);
DBMS_OUTPUT.put_line(emp_num || ' X 9 = ' || emp_num * 9);
END;


-- 2. employees 테이블에서 201번 사원의 이름과 이메일 주소를 출력하는
-- 익명블록을 만들어 보자.
DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_email employees.email%TYPE;
BEGIN
    SELECT
        e.first_name, e.email
    INTO    
        v_emp_name, v_emp_email
    FROM employees e
    WHERE employee_id = 201;

DBMS_OUTPUT.put_line('이름: ' || v_emp_name);
DBMS_OUTPUT.put_line('이메일: ' || v_emp_email);
END;


-- 3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤 (MAX 함수 사용)
-- 이 번호 + 1번으로 아래의 사원을 emps 테이블에
-- employee_id, last_name_, email, hire_date, job_id를 신규 삽입하는 익명 블록을 만드세요.
-- SELECT절 이후에 INSERT문 사용이 가능합니다. (나머지 컬럼은 아무값이나 넣으세요.)
/*
사원명: steven
이메일: stevenjobs
입사일자: 오늘날짜
job_id: CEO
*/

DECLARE
    v_emp_id employees.employee_id%TYPE;
BEGIN
    SELECT 
        MAX(employee_id)
    INTO v_emp_id    
    FROM employees;
   
    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES
        (v_emp_id+1, 'steven', 'stevenjobs', sysdate, 'CEO');
    
    COMMIT;
END;

SELECT * FROM emps;


DROP TABLE emps;

CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);




