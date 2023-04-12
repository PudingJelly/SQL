
-- 숫자 함수
-- ROUND(반올림)
-- 원하는 반올림 위치를 매개값으로 지정, 음수를 주는 것도 가능
SELECT
    ROUND(3.1415, 3), --소수점 셋째자리까지 표현
    ROUND(45.923, 0), --소수점 0번째자리까지 표현 = 소수점 첫째자리에서 반올림
    ROUND(45.923, -1) --
FROM dual;

-- TRUNC(절사)
-- 정해진 소수점 자리수까지 잘라냅니다.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS (절대값)
SELECT
    ABS(-34)
FROM dual;
