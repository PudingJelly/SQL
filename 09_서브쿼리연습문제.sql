/*
문제 1.
-EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들의 데이터를 출력 하세요 ( AVG(컬럼) 사용)
-EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 수를 출력하세요
-EMPLOYEES 테이블에서 job_id가 IT_PROG인 사원들의 평균급여보다 높은 사원들을 데이터를 출력하세요
*/

SELECT * 
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);

SELECT COUNT(*) 
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees);

SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees
                WHERE job_id = 'IT_PROG');
---------------------------------------------------------------
/*
문제 2.
-DEPARTMENTS테이블에서 manager_id가 100인 사람의 department_id와
EMPLOYEES테이블에서 department_id가 일치하는 모든 사원의 정보를 검색하세요.
*/
SELECT * 
FROM employees
WHERE department_id = (SELECT d.department_id FROM departments d    
                       WHERE d.manager_id = 100);
-----------------------------------------------------------------


/*
문제 3.
-EMPLOYEES테이블에서 “Pat”의 manager_id보다 높은 manager_id를 갖는 모든 사원의 데이터를 출력하세요
-EMPLOYEES테이블에서 “James”(2명)들의 manager_id와 갖는 모든 사원의 데이터를 출력하세요.
*/
SELECT *
FROM employees
WHERE manager_id > (SELECT manager_id
                    FROM employees
                    WHERE first_name = 'Pat');
                    
SELECT *
FROM employees
WHERE manager_id IN (SELECT manager_id
                    FROM employees
                    WHERE first_name = 'James');
--------------------------------------------------------------


/*
문제 4.
-EMPLOYEES테이블 에서 first_name기준으로 내림차순 정렬하고, 41~50번째 데이터의 행 번호, 이름을 출력하세요
*/
SELECT *
FROM
    (SELECT ROWNUM AS rn, tbl.first_name
     FROM
        (
        SELECT *
        FROM employees
        ORDER BY first_name DESC
        )tbl
    )tbl2
WHERE rn BETWEEN 41 AND 50;


/*
문제 5.
-EMPLOYEES테이블에서 hire_date기준으로 오름차순 정렬하고, 31~40번째 데이터의 행 번호, 사원id, 이름, 번호, 
입사일을 출력하세요.
*/
SELECT *
FROM
    (
    SELECT ROWNUM AS rn, tbl.*
    FROM
        (
        SELECT employee_id, first_name, phone_number, hire_date
        FROM employees
        ORDER BY hire_date ASC
        ) tbl
    )tbl2
WHERE rn > 30 AND rn <= 40;


/*
문제 6.
employees테이블 departments테이블을 left 조인하세요
조건) 직원아이디, 이름(성, 이름), 부서아이디, 부서명 만 출력합니다.
조건) 직원아이디 기준 오름차순 정렬
*/
SELECT
    e.employee_id, 
    e.first_name || ' ' || e.last_name AS 이름,
    e.department_id, 
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
ORDER BY e.employee_id ASC;


/*
문제 7.
문제 6의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
*/
SELECT
    e.employee_id, 
    e.first_name || ' ' || e.last_name AS 이름,
    e.department_id,
   (
        SELECT
            department_name
        FROM departments d
        WHERE d.department_id = e.department_id
    ) AS department_name
FROM employees e
ORDER BY e.employee_id ASC;


/*
문제 8.
departments테이블 locations테이블을 left 조인하세요
조건) 부서아이디, 부서이름, 매니저아이디, 로케이션아이디, 스트릿_어드레스, 포스트 코드, 시티 만 출력합니다
조건) 부서아이디 기준 오름차순 정렬
*/
SELECT
    d.department_id, d.department_name, d.manager_id,
    loc.location_id, loc.street_address, loc.postal_code, loc.city
FROM departments d
LEFT JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY d.department_id ASC;


/*
문제 9.
문제 8의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
*/
SELECT 
    d.department_id, d.department_name, d.manager_id,
    (
        SELECT
            loc.location_id
        FROM locations loc
        WHERE loc.location_id = d.location_id
     ) AS LOC_ID,
    (
        SELECT
            loc.street_address
        FROM locations loc
        WHERE loc.location_id = d.location_id
    ) AS ST_ADDRESS,
    (
        SELECT
            loc.postal_code
        FROM locations loc
        WHERE loc.location_id = d.location_id
    ) AS POS_CODE,
    (
        SELECT
            loc.city
        FROM locations loc
        WHERE loc.location_id = d.location_id
    ) AS CITY
FROM departments d
ORDER BY d.department_id ASC;


/*
문제 10.
locations테이블 countries 테이블을 left 조인하세요
조건) 로케이션아이디, 주소, 시티, country_id, country_name 만 출력합니다
조건) country_name기준 오름차순 정렬
*/
SELECT
    loc.location_id, loc.street_address, loc.city,
    c.country_id, c.country_name
FROM locations loc
LEFT JOIN countries c
ON loc.country_id = c.country_id
ORDER BY c.country_name ASC;


/*
문제 11.
문제 10의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
*/
SELECT 
    loc.location_id, loc.street_address, loc.city,
    (
        SELECT
            country_id
        FROM countries c
        WHERE c.country_id = loc.country_id
    ) AS country_id,
    (
        SELECT
            country_name
        FROM countries c
        WHERE c.country_id = loc.country_id
    ) AS country_name
FROM locations loc
ORDER BY country_name ASC;


