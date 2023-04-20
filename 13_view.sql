
/*
view는 제한적인 자료만 보기 위해 사용하는 가상 테이블의 개념입니다.
뷰는 기본 테이블로 유도된 가상 테이블이기 대문에
필요한 컬럼만 저장해 두면 관리가 용이해 집니다.
뷰는 가상테이블로 실제 데이터가 물리적으로 저장된 형태는 아닙니다.
뷰를 통해서 데이터에 접근하면 원본 데이터는 안전하게 보호될 수 있습니다.
*/

SELECT * FROM user_sys_privs;

-- 단순 뷰
-- 뷰의 컬럼 이름은 함수 같은 가상표현식이면 안됩니다.

SELECT
    employee_id,
    first_name || ' ' || last_name,
    job_id,
    salary
FROM employees
WHERE department_id = 60;

CREATE VIEW view_emp AS (
    SELECT
        employee_id,
        first_name || ' ' || last_name AS name,
        job_id,
        salary
    FROM employees
    WHERE department_id = 60
);

SELECT * FROM view_emp;
