
-- 1. 모든 사원의 사원번호, 이름, 입사일, 급여를 출력하세요.
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees;

--2. 모든 사원의 이름과 성을 붙여 출력하세요. 열 별칭은 name으로 하세요.
SELECT 
    first_name || ' ' || last_name AS name
FROM employees;

--3. 50번 부서 사원의 모든 정보를 출력하세요.
SELECT *
FROM employees
WHERE department_id = 50;

--4. 50번 부서 사원의 이름, 부서번호, 직무아이디를 출력하세요.
SELECT 
    first_name,
    last_name,
    department_id,
    job_id
FROM employees
WHERE department_id = 50;

--5. 모든 사원의 이름, 급여 그리고 300달러 인상된 급여를 출력하세요.
SELECT 
    first_name,
    last_name,
    salary,
    salary + 300
FROM employees;

--6. 급여가 10000보다 큰 사원의 이름과 급여를 출력하세요.
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 10000;

--7. 보너스를 받는 사원의 이름과 직무, 보너스율을 출력하세요.
SELECT 
    first_name, 
    last_name, 
    job_id,
    commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--8. 2003년도 입사한 사원의 이름과 입사일 그리고 급여를 출력하세요.(BETWEEN 연산자 사용)
SELECT
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

--9. 2003년도 입사한 사원의 이름과 입사일 그리고 급여를 출력하세요.(LIKE 연산자 사용)
SELECT 
    first_name,
    last_name,
    hire_date,
    salary
FROM employees
WHERE hire_date LIKE '03%';

--10. 모든 사원의 이름과 급여를 급여가 많은 사원부터 적은 사원순서로 출력하세요.
SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC;

--11. 위 질의를 60번 부서의 사원에 대해서만 질의하세요. (컬럼: department_id)
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE department_id = 60
ORDER BY salary DESC;

--12. 직무아이디가 IT_PROG 이거나, SA_MAN인 사원의 이름과 직무아이디를 출력하세요.
SELECT
    first_name,
    last_name,
    job_id
FROM employees
WHERE job_id = 'IT_PROG' 
OR job_id = 'SA_MAN';

SELECT
    first_name,
    last_name,
    job_id
FROM employees
WHERE job_id IN('IT_PROG','SA_MAN');

--13. Steven King 사원의 정보를 “Steven King 사원의 급여는 24000달러 입니다” 형식으로 출력하세요.
SELECT 
    '"' || first_name || ' ' ||last_name || 
    ' 사원의 급여는 ' || salary || '달러 입니다"'
    AS TEST
FROM employees
--WHERE salary = 24000 
WHERE first_name = 'Steven'
AND last_name =  'King';

--14. 매니저(MAN) 직무에 해당하는 사원의 이름과 직무아이디를 출력하세요. (컬럼:job_id)
SELECT
    first_name,
    last_name,
    job_id
FROM employees
WHERE job_id LIKE '___MAN';

SELECT
    first_name,
    last_name,
    job_id
FROM employees
WHERE job_id LIKE '%MAN';

--15. 매니저(MAN) 직무에 해당하는 사원의 이름과 직무아이디를 직무아이디 순서대로 출력하세요.
SELECT
    first_name,
    last_name,
    job_id
FROM employees
WHERE job_id LIKE '___MAN'
ORDER BY job_id ASC;

SELECT
    first_name,
    last_name,
    job_id
FROM employees
WHERE job_id LIKE '%MAN'
ORDER BY job_id;
-- 정렬의 기본값은 오름차순으로 정렬된다
-- 가독성을 위해서는 ASC를 명시하는 것이 좋다
