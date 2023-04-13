
-- lower(소문자), initcap(앞글자만 대문자), upper(대문자)

/*
dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서,
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블 입니다.
일시적인 산술 연산이나 날짜 연산 등에 주로 사용합니다.
*/

SELECT * FROM dual;


SELECT 
    'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM 
    dual;
    
SELECT last_name, LOWER(last_name), INITCAP(last_name), UPPER(last_name)
FROM employees;

SELECT last_name
FROM employees
WHERE LOWER(last_name) = 'austin';

-- length(길이), instr(문자 찾기, 없으면 0을 반환, 있으면 인덱스 값 반환)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef', 'a')    
FROM dual;

SELECT 
    first_name, LENGTH(first_name), INSTR(first_name, 'a')
FROM employees;

-- substr(문자열 자르기), concat(문자 연결) 1부터 시작.
SELECT
    'abcdef' AS ex,
    SUBSTR('abcdef', 1, 4),
    CONCAT('abc','def') -- 매가값을 2개까지 받을 수 있음
FROM dual;

SELECT
    first_name,
    SUBSTR(first_name, 1, 3),
    CONCAT(first_name, last_name)
FROM employees;

-- LPAD, RPAD (좌, 우측 지정문자열로 채우기)
SELECT
    LPAD('abc', 10, '*'),
    RPAD('abc', 10, '*')
FROM dual;

-- LTRIM(), RTRIM(), TRIM() 공백 제거
-- LTRIM(param1, param2) -> param2의 값을 param1에서 찾아서 제거.(왼쪽부터)
-- RTRIM(param1, param2) -> param2의 값을 param1에서 찾아서 제거.(오른쪽부터)
-- LTRIM(), RTRIM()은 매개값을 두개를 주면 제거 작업 진행

SELECT LTRIM('javascript_java', 'java') FROM dual;
SELECT RTRIM('javascript_java', 'java') FROM dual;
SELECT TRIM('    java    ') FROM dual;
SELECT LTRIM('    javascript_java') FROM dual;
SELECT RTRIM('javascript_java    ') FROM dual;
 
-- replace()
SELECT
    REPLACE('My dream is a president', 'president', 'programmer')
FROM dual;

SELECT
    REPLACE('My dream is a president', ' ', '')
FROM dual;

SELECT
    REPLACE(REPLACE('My dream is a president', 'president', 'programmer'),' ','')
FROM dual;

SELECT 
    REPLACE(CONCAT('hello', 'world!'),'!','?')    
FROM dual;

--문제 1.
--EMPLOYEES 테이블 에서 이름, 입사일자 컬럼으로 변경해서 이름순으로 오름차순 출력 합니다.
--조건 1) 이름 컬럼은 first_name, last_name을 붙여서 출력합니다.
--조건 2) 입사일자 컬럼은 xx/xx/xx로 저장되어 있습니다. xxxxxx형태로 변경해서 출력합니다.

SELECT
    CONCAT(first_name, last_name) AS 이름,
    REPLACE(hire_date,'/','') AS 입사일자
FROM employees
ORDER BY 이름 ASC;

--문제 2.
--EMPLOYEES 테이블 에서 phone_numbe컬럼은 ###.###.####형태로 저장되어 있다
--여기서 처음 세 자리 숫자 대신 서울 지역변호 (02)를 붙여 전화 번호를 출력하도록 쿼리를 작성하세요
SELECT
    CONCAT('(02).',SUBSTR(phone_number,5,12))
FROM employees;

SELECT
    CONCAT('(02)',SUBSTR(phone_number,5,LENGTH(phone_number)))
FROM employees;

--문제 3. 
--EMPLOYEES 테이블에서 JOB_ID가 it_prog인 사원의 이름(first_name)과 급여(salary)를 출력하세요.
--조건 1) 비교하기 위한 값은 소문자로 입력해야 합니다.(힌트 : lower 이용)
--조건 2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력합니다. 
--이 열의 열 별칭은 name입니다.(힌트 : rpad와 substr 또는 substr 그리고 length 이용)
--조건 3) 급여는 전체 10자리로 출력하되 나머지 자리는 *로 출력합니다. 
--이 열의 열 별칭은 salary입니다.(힌트 : lpad 이용)
SELECT
    RPAD(SUBSTR(first_name,1,3),LENGTH(first_name),'*') AS name,
    LOWER(LPAD(salary,10,'*')) AS salary
FROM employees
WHERE 
    LOWER(job_id) = 'it_prog'  
 
    