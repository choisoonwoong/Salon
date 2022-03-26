/* 회원 테이블 */
create table company_member(
ID varchar2(26) primary key,	-- 아이디
password varchar2(38));			-- 비밀번호

/* 지출내역 리스트 */
create table Expenses (
no number(10),					-- 지출내역번호
name varchar2(50),				-- 지출내역명
money number,					-- 지출금액
orderdate date,					-- 지출날짜
memo varchar2(100));			-- 지출메모

/* 1-12월 테이블 */
create table monthh( month varchar2(20));	-- 1-12월

/* 쿠폰 테이블 (방문횟수 카운트용) */
create table Coupon(
c_number number(38),			-- 고객번호
name varchar2(50),				-- 고객이름
phone varchar2(26), 			-- 핸드폰번호
coupon number(38),				-- 방문횟수
memo varchar2(70));				-- 고객메모

/* 전체 고객 입력 테이블 */
create table company(
c_number number(38),			-- 고객번호
c_name varchar2(50),			-- 고객이름
c_phone varchar2(26),			-- 핸드폰번호
c_payment varchar2(26),			-- 결제수단
c_money number(38),				-- 금액
c_date date,					-- 등록날짜
c_memo varchar2(70));			-- 고객메모

/* 쿠폰 테이블 (서비스 횟수 관리용) */
create table coupon2 (
c_number number(38),			-- 고객번호
c_name varchar2(50),			-- 고객이름
c_coupon number(38),			-- 서비스 카운트
c_date date,					-- 등록날짜
phone varchar(26) primary key,	-- 핸드폰번호
c_count number(38),				-- 서비스받은 횟수
c_memo varchar2(70),			-- 고객메모
c_payment varchar2(26)			-- 결제수단
);

/* 스타일 테이블 */
create table choice(
c_number number,				-- 스타일번호
option1 varchar2(30),			-- 스타일이름
money number);   				-- 스타일가격

/* 특이사항 테이블 */
create table company_cmt(
c_number number,				-- 코멘트번호
c_comment varchar2(100));		-- 코멘트내용

create sequence company_seq		-- 고객번호 자동생성
Start with 1
increment by 1;

create sequence coupon_seq		-- 고객번호 자동생성
Start with 1
increment by 1;

create sequence coupon2_seq		-- 고객번호 자동생성
Start with 1
increment by 1;

create sequence choice_seq		-- 스타일번호 자동생성
Start with 1
increment by 1;

create sequence Expenses_seq	-- 지출내역번호 자동생성
Start with 1
increment by 1;

create sequence company_cmt_seq		-- 코멘트번호 자동생성
Start with 1
increment by 1;

/* ~2030년 날짜 테이블*/
create table company_day as
SELECT  DATE_COL as day1, TO_CHAR(DATE_COL,'DAY') as day2
FROM    (   
        SELECT TO_DATE('20210101','YYYYMMDD') + LEVEL - 1 DATE_COL  
        FROM DUAL  
        CONNECT BY LEVEL <= ( TO_DATE('20300101','YYYYMMDD') - TO_DATE('20211201','YYYYMMDD') + 1 )  
);