
-- 집합 연산자
-- UNION(합집합 중복허용X), UNION ALL(합집합 중복허용O), 
-- INTERSECT(교집합), MINUS(차집합)
-- 위 아래 column 개수와 데이터 타입이 정확히 일치해야 합니다.
-- 절과 절 사이에 작성하여 적용

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

---------------------------------------------

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

------------------------------------------------

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

---------------------------------------------

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS -- A에서 B가 겹치는것만 빼고 출력
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

-----------------------------------------------

SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS --B에서 A와 겹치는것만 빼고 출력
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';

