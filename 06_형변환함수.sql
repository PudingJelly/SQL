

-- 형 변환함수 TO_CHAR, TO_NUMBER, TO_DATE

-- 날짜를 문자로 TO_CHAR(값, 형식)
SELECT 
    TO_CHAR(sysdate) 
FROM dual;

SELECT 
    TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS') 
FROM dual;

SELECT 
    TO_CHAR(sysdate, 'YY-MM-DD DY PM:HH:MI:SS') 
FROM dual;

SELECT 
    first_name,
    TO_CHAR(hire_date,'YYYY"년" MM"월" DD"일"')
FROM employees;

-- 사용하고 싶은 문자를 ""로 묶어서 전달합니다.

-- 숫자를 문자로 TO_CHAR(값, 형식)
SELECT TO_CHAR(20000, '99999') FROM dual;
-- 주어진 자릿수에 숫자를 모두 표기할 수 없어서 모두 #으로 표기됩니다
SELECT TO_CHAR(20000, '9999') 
FROM dual;

SELECT TO_CHAR(20000.26, '99999.9') 
FROM dual;

SELECT TO_CHAR(20000, '99,999') 
FROM dual;

-- 현재 PC기준 사용하고 있는 나라의 화폐기호 표시 'L'
SELECT 
    TO_CHAR(salary, 'L99,999') AS salary
FROM employees;

-- 문자를 숫자로 변환 TO_NUMBER(값, 형식)
SELECT '2000' + 2000 FROM dual; -- 자동 형변환(문자 -> 숫자)
SELECT TO_NUMBER('2000') + 2000 FROM dual; -- 명시적 형 변환

SELECT '$3,300' + 2000 FROM dual; -- 에러
SELECT TO_NUMBER('$3,300', '$9,999') + 2000 FROM dual;

-- 문자를 날짜로 변환하는 함수 TO_DATE(값, 형식)
SELECT TO_DATE('2023-04-13')FROM dual;
SELECT sysdate - '2021-03-26' FROM dual; -- 에러
SELECT sysdate - TO_DATE('2021-03-26') FROM dual;
SELECT TO_DATE('2020/12/25', 'YY-MM-DD') FROM dual;
-- 주어진 문자열을 모두 변환해야 합니다.
SELECT TO_DATE('2021/03/31 12:23:50', 'YY-MM-DD HH:MI:SS') FROM dual;

-- XXXX년 XX월 XX일 문자열 형식으로 변환해 보세요
-- 조회 컬럼명은 dateInfo 라고 하겠습니다.
SELECT 
    TO_CHAR(TO_DATE('20050102', 'yyyy-mm-dd'), 'YYYY"년" MM"월" DD"일"') 
    AS dateInfo
FROM dual;

-- NULL 제거 함수 NVL(컬럼, 변환할 타겟값)
SELECT null FROM dual;
SELECT NVL(null, 0) FROM dual;

SELECT
    first_name,
    NVL(commission_pct, 0) AS comm_pct
FROM employees;

-- NULL 제거 함수 NVL2(컬럼, NULL이 아닐 경우의 값, NULL일 경우의 값)
SELECT
    NVL2('abc', '널아님', '널임')
FROM dual;

SELECT
    first_name,
    NVL2(commission_pct, 'true', 'false') AS commi_pct
FROM employees;

SELECT
    first_name,
    commission_pct,
    NVL2(commission_pct, salary + (salary * commission_pct), salary) AS real_salary   
FROM employees;

-- DECODE(컬럼 혹은 표현식, 항목1, 결과1, 항목2, 결과2, 항목3, 결과3,....default)
SELECT
    DECODE('C','A','A입니다.', 'B','B입니다.', 'C','C입니다.', '모르겠는데요?')
FROM dual;

SELECT
    job_id,
    salary,
    DECODE(
        job_id, 
        'IT_PROG',salary*1.1,
        'FI_MGR', salary*1.2,
        'AD_VP', salary*1.3
    ) AS result
FROM employees;

-- CASE WHEN THEN END
SELECT
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary*1.1
        WHEN 'FI_MGR' THEN salary*1.2
        WHEN 'AD_VP' THEN salary*1.3
        WHEN 'FI_ACCOUNT' THEN salary*1.4
        ELSE salary
    END) AS result
FROM employees;

--문제 1.
--현재일자를 기준으로 EMPLOYEE테이블의 입사일자(hire_date)를 참조해서 근속년수가 17년 이상인
--사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요. 
--조건 1) 근속년수가 높은 사원 순서대로 결과가 나오도록 합니다
SELECT
    employee_id AS 사원번호,
    first_name || ' ' || last_name AS 사원명,
    hire_date AS 입사일자,
    ROUND((sysdate - hire_date)/365,0) AS 근속년수
FROM employees
WHERE ROUND((sysdate - hire_date)/365,0) >= 17
ORDER BY 근속년수 DESC;

SELECT 
    employee_id AS 사원번호,
    CONCAT(first_name, last_name) AS 사원명,
    hire_date AS 입사일자,
    TRUNC((sysdate - hire_date) / 365) AS 근속년수
FROM employees
WHERE (sysdate - hire_date) / 365 >= 17
ORDER BY 근속년수 DESC;

-- WHERE절에 근속년수를 작성 할 수 없는 이유는 SQL의 실행 순서 때문에 적용X
-- 테이블결정, 조건발동 순서 (AS가 붙는 경우는 가장 마지막 SELECT 출력시에 적용)


--문제 2.
--EMPLOYEE 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다.
--100이라면 ‘사원’, 
--120이라면 ‘주임’
--121이라면 ‘대리’
--122라면 ‘과장’
--나머지는 ‘임원’ 으로 출력합니다.
--조건 1) department_id가 50인 사람들을 대상으로만 조회합니다

SELECT
    first_name,
    manager_id,
    (case manager_id
        WHEN 100 THEN '사원'
        WHEN 120 THEN '주임'
        WHEN 121 THEN '대리'
        WHEN 122 THEN '과장'
        ELSE '임원'
    END) AS 직급
FROM employees
WHERE department_id = 50;

SELECT
    first_name,
    manager_id,
    DECODE(
        manager_id,
        100, '사원',
        120, '주임',
        121, '대리',
        122, '과장',
        '임원'
    ) AS 직급
FROM employees
WHERE department_id = 50;

----------------------------------------------------------------

-- DECODE는 범위를 지정할 수 없다
-- 정확한 값을 기준으로 지정해야 정상 동작한다
SELECT
    salary,
    employee_id,
    first_name,
    DECODE(
        TRUNC(salary / 1000),
        0, 'E',
        1, 'D',
        2, 'C',
        3, 'B',
        'A'
    ) AS grade
FROM employees
ORDER BY salary DESC;


-- case문은 범위 지정 가능
-- 부등호도 사용 가능
SELECT
    salary,
    employee_id,
    first_name,
    (CASE
        WHEN salary BETWEEN 0 AND 999 THEN 'E'
        WHEN salary BETWEEN 1000 AND 1999 THEN 'D'
        WHEN salary BETWEEN 2000 AND 2999 THEN 'C'
        WHEN salary BETWEEN 3000 AND 3999 THEN 'B'
        ELSE 'A'       
    END) AS grade
FROM employees
ORDER BY salary DESC;





