CREATE TABLE users(
    user_number NUMBER(5) PRIMARY KEY,
    user_name VARCHAR2(20) NOT NULL,
    phone_number VARCHAR2(30) NOT NULL,
    total_paying NUMBER(10) DEFAULT 0,
    grade VARCHAR2(10) DEFAULT 'BRONZE'
);

drop table users;

CREATE SEQUENCE users_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
    
drop sequence users_seq;
    
SELECT * FROM users;

CREATE TABLE movie(
    serial_number NUMBER(5) PRIMARY KEY,
    movie_name VARCHAR2(50) NOT NULL,
    nation VARCHAR2(20) NOT NULL,
    pub_year DATE,
    rental VARCHAR2(1) NOT NULL
);    

drop table movie;

drop sequence movie_seq;

CREATE SEQUENCE movie_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
    
SELECT * FROM movie;

drop table order_history;

CREATE TABLE order_history (
    order_no NUMBER(5) PRIMARY KEY,
    user_number NUMBER(5) NOT NULL,
    serial_number NUMBER(5) NOT NULL,
    order_date DATE DEFAULT sysdate,
    return_date DATE DEFAULT sysdate + 3
);

CREATE SEQUENCE order_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;

CREATE OR REPLACE TRIGGER trg_order_history
    AFTER INSERT
    ON order_history
    FOR EACH ROW
    
DECLARE
    v_serial_number NUMBER;
BEGIN
    SELECT 
        :NEW.serial_number
    INTO v_serial_number
    FROM dual;
    
    UPDATE movie SET rental = 'false'
    WHERE serial_number = v_serial_number;
END;

SELECT * FROM movie WHERE NATION LIKE '%미국%'

