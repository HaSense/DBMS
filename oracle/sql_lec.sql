SELECT * FROM tab;

SELECT * FROM employees;

#테이블 구성정보 살펴보기
DESC employees;

#부서(Departments) 테이블을 전체 조회해 보세요.
SELECT * FROM departments;
#부서 테이블의 타입을 조회해 주세요.
DESC DEPARTMENTS;
#지역 테이블 조회해 봅시다.
SELECT * FROM LOCATIONS;

#이름과 급여를 조회해 봅시다. 테이블은 employees
SELECT first_name, salary FROM employees;
#급여순으로 이름과 급여를 조회해 보고싶다.
SELECT first_name, salary FROM employees ORDER BY salary DESC;

#직원테이블에서 EMPLOYEE_ID, First_Name, Last_Name, Department_ID 조회를 해주세요.
#단, 부서ID 기준 내림차순으로 정렬해 주세요.
SELECT EMPLOYEE_ID, Last_Name, First_Name, Department_ID FROM employees
ORDER BY EMPLOYEE_ID DESC;

SELECT MIN_SALARY FROM jobs order by min_salary;

#중복된 컬럼 자료를 제거하고 싶습니다.
SELECT DISTINCT MIN_SALARY FROM jobs order by min_salary;

#JOB_HISTORY에서 중복된 EMPLOYEE_ID를 제거하고 순수한 EMPLOYEE_ID만 출력해 주세요.
SELECT DISTINCT EMPLOYEE_ID FROM JOB_HISTORY;

select * from dept;
INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');

#데이터 만들기
DROP TABLE DEPT;
CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) ) ;
DROP TABLE EMP;
CREATE TABLE EMP
       (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy')-85,3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy')-51,1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
DROP TABLE BONUS;
CREATE TABLE BONUS
	(
	ENAME VARCHAR2(10)	,
	JOB VARCHAR2(9)  ,
	SAL NUMBER,
	COMM NUMBER
	) ;
DROP TABLE SALGRADE;
CREATE TABLE SALGRADE
      ( GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER );
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;


#사원 정보가 들어있는 EMP 테이블
DESC EMP;

#중복 열 제거
SELECT DISTINCT DEPTNO FROM EMP;

#ALL로 중복되는 열 제거 없이 그대로 출력하기
SELECT ALL JOB, DEPTNO FROM EMP;

#테이블에 연산식 컬럼을 삽입해 봅시다.
SELECT ENAME, SAL, COMM FROM EMP;

SELECT ENAME AS "이름", SAL AS 급여, (SAL*12)+COMM AS 연봉,COMM FROM EMP;

#90Page 문제풀이
#사원 번호를 기준으로 내림차순 정렬 되도록 코드를 채워 보세요.
SELECT * FROM EMP ORDER BY empno desc;

#92Page 2번문제
select distinct job from emp;

#조건의 WHERE을 배워봅시다.
select * from emp;
#부서번호가 30번인 직원 데이터 모두를 출력해 봅시다.
select * from emp
where deptno=30;

#월급을 $950 받는 직원의 이름은 어떻게 됩니까???
SELECT ENAME FROM emp WHERE sal = 950;

#업무는 "SALESMAN" 부서번호는 30번인 직원의 레코드 정보는??
SELECT * FROM EMP WHERE JOB='SALESMAN'; AND DEPTNO=30;

#사원번호(EMPNO)가 7499이고 부서번호(DEPTNO)가 30번인 사원 정보를 출력하세요!!!!
#P98
select * from emp
where empno=7499 
and deptno=30
and ename='ALLEN';

desc emp;
describe emp;


#부서번호 20번 이거나(or) 직업이 'SALESMAN'인 사원의 정보만 나오도록 코드를 채워보세요.
select * from emp
where deptno = 20
or job='SALESMAN';


#산술 연산자를 사용한 예
select * from emp
where sal * 12 = 36000;

#급여가 $3000 이상인 직원의 정보는???
select * from emp
where sal >= 3000;

#급여가 $2500이상이고 직업이 'ANALYST'인 사원의 정보는???
select * from emp
where sal >= 2500
and job='ANALYST';

#문자 대소비교 연산자로 비교하기
select * from emp
where ename <= 'B';

#직원(EMP)테이블에서 급여가 $3000인 데이터만 제외하고 모두 출력해주세요...????
#p104
select * from emp
where sal != 3000;

select * from emp
where sal <> 3000;

select * from emp
where sal ^= 3000;
#논리 부정 연산자
select * from emp
where NOT sal = 3000;


# 지정된 조건에 맞는 데이터 찾는방법
# IN
# JOB이 MANAGER, SALESMAN, CLERK 인 조건만 직원테이블에서 검색해 주세요???

select * from emp
WHERE job IN( 'MANAGER', 'SALESMAN', 'CLERK' );

select * from emp
WHERE job NOT IN( 'MANAGER', 'SALESMAN', 'CLERK' );

#급여가 $2000 이상 $3000 이하인 직원은??
select * from emp
where sal >=2000 and sal <= 3000;

select * from emp
where sal between 2000 and 3000;


#LIKE 연산자 문자열 검색
select * from emp
where ename LIKE 'S%';

#두번째 이름이 L로 시작
select * from emp
where ename LIKE '_L%';

#글자에서 "AM"이보함된 이름 전체
select * from emp
where ename LIKE '%AM%';

#"AM"포함 되어있지 않는 이름
select * from emp
where ename NOT LIKE '%AM%';

select ename, sal, comm from emp;

#등가비교 연산자 NULL로 비교하기
select * from emp
where comm = NULL;  # 사용하지 않는 방식

select * from emp
where comm IS NULL;  # 사용되는 방식


#AND 연산자와 IS NULL 연산자 사용하기
select * from emp
where sal > NULL
or comm IS NULL;

#UNION
#1
select empno, ename, sal, deptno from emp
where deptno = 10;
#2
select empno, ename, sal, deptno from emp
where deptno = 20;
#3
select empno, ename, sal, deptno from emp
where deptno = 10
UNION
select empno, ename, sal, deptno from emp
where deptno = 20;

#5-36
select empno, ename, sal, deptno from emp
MINUS
select empno, ename, sal, deptno from emp where deptno=10;

#INTERSECT
#5-37
select empno, ename, sal, deptno from emp
INTERSECT
select empno, ename, sal, deptno from emp where deptno=10;


#1
select * from emp where ename like '%S';
#2
select empno, ename, job, sal, deptno from emp
where job='SALESMAN';
#3
select empno, ename, job, sal, deptno from emp
where deptno IN (20, 30) and sal > 2000;
#4
select * from emp where sal >=2000 and sal <= 3000;
#5
select ename, empno, sal, deptno from emp
where ename like '%E%' and deptno = 30 
and sal not between  1000 and 2000;
#6
select * from emp where comm is null and mgr is not null
and ename not like '_L%'
and job='MANAGER' or job = 'CLERK';









#월급을 $950 받는 직원의 이름은 어떻게 됩니까???
desc emp;

select ename from emp
where sal = 950;

#오라클 내장함수
select ename, UPPER(ename), LOWER(ename), INITCAP(ename) from emp;

#UPPER함수로 문자열 비교하기(사원이름이 SCOTT인 데이터 찾기)
select * from emp
where upper(ename) = upper('scott');

#사원 이름에 scott단어가 포함된 데이터 찾기
select * from emp
where upper(ename) LIKE upper('%scott%');

#문자열의 길이를 구하는 함수
select ename, length(ename) from emp
where length(ename) < 5;

#한글길이 비교
select length('한글'), lengthb('한글') from dual;

#사용빈도가 높은 단일행 함수 SUBSTR
select job, substr(job, 1, 2), substr(job, 3, 2) , substr(job,5) from emp;

#substr사용해서 모든 사원 이름을 세번째 글자부터 끝까지 출력되려면 어떻게????
select job, substr(job, 3) from emp;

select job, 
       substr(job, -length(job)),
       substr(job, -length(job), 2),
       substr(job, -3)
from emp;

#주민등록번호에서 생일만 출력해 주세요.
#901101
select substr('901101', 3,4) from dual;
select substr('901101', 1,2) from dual;

#문자열 안에서 특정 문자 위치를 찾는 INSTR
select INSTR('반갑습니다. 오라클~!', '오') as 컬럼1,
    INSTR('반갑습니다. 오라클~!', '습') as 컬럼2
from dual;

#특정 문자를 포함하고 있는 행 찾기
select * from emp
where INSTR(ename, 'S') > 0;

select * from emp
where ename LIKE '%S%';

#문자열 변환 REPLACE
select '010-1234-5678',
      REPLACE('010-1234-5678', '-', ' '),
      REPLACE('010-1234-5678', '-')
from dual;

select '901101-3123456',
       REPLACE('901101-3123456', '-'),
       REPLACE('901101-3123456', '90', '95')
from dual;

#빈공간을 채우는 함수 PAD
select 'Oracle',
     LPAD('Oracle', 10, '#'),
     RPAD('Oracle', 10, '#'),
     LPAD('Oracle', 10)
from dual;
#주민번호 가리기
select RPAD(substr('971225-1234567', 1, 7), 14, '*'),
       RPAD('010-1234-', 13, '*')
from dual;

#문자 결합 ( + )
select concat(empno, ename) from emp where ename=upper('scott');
#문자결합 기호
select empno||'-'||ename from emp;

#공백제거
select '      Oracle       ' ,
       TRIM('      Oracle       '),
       RTRIM('      Oracle       '),
       LTRIM('      Oracle       ')
from dual;


#데이터 정의어 
#Create
CREATE TABLE emp_ddl01(
    EMPNO    NUMBER(4),
    ENAME    VARCHAR2(10)
);
desc emp_ddl01;
#테이블 삭제
DROP TABLE emp_ddl01;
#데이터 삽입
INSERT INTO emp_ddl01(empno, ename)
VALUES (1, '홍길동');
#조회
select * from emp_ddl01;

#P266
Drop table dept_temp;
#DEPT테이블을 복사해서 DEPT_TEMP테이블을 만들어 봅시다.
create table dept_temp as select * from dept;
#
select * from dept_temp;
desc dept_temp;
#10-3
#50번 부서 'DATABASE' 위치 'ANDONG'
INSERT INTO dept_temp (deptno, dname, loc) 
VALUES (50, 'DATABASE', 'ANDONG');
#60번 부서 'COMPUTER' 위치 'SEOUL'
INSERT INTO dept_temp (deptno, dname, loc) 
VALUES (60, 'COMPUTER', 'SEOUL');

UPdate dept_temp set deptno = 60 where loc=upper('seoul');
#컴퓨터 부서를 Busan으로 수정해 보세요.
UPDATE dept_temp set LOC = 'BUSAN' where deptno=60;

commit;
select * from dept_temp;

DESC DEPT_TEMP;
#에러연습
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (600, 'NETWORK', 'BUSAN');

#NULL 입력
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (70, 'WEB', NULL);

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (80, 'MOBILE', ''); #공백은 NULL로 인식
#삭제
DELETE FROM DEPT_TEMP WHERE DEPTNO = 80;

#10-7
#열 데이터를 넣지 않는 방식으로 NULL 데이터 입력
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
VALUES (90, 'INCHEON');

SELECT * FROM DEPT_TEMP;

#데이터 없이 테이블 복사하기
#10-8
CREATE TABLE EMP_TEMP 
    AS SELECT * FROM EMP WHERE 1 <> 1;
    
SELECT * FROM EMP_TEMP;
#EMP_TEMP 테이블을 삭제하고 내용까지 복사한 EMP_TEMP을 만들어 봅시다.
DROP TABLE EMP_TEMP;
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP;
SELECT * FROM EMP_TEMP;



#P146 SQL 일반함수
#숫자데이터
select  ROUND(1234.5678),
        ROUND(1234.5678, 0),
        ROUND(1234.6578, 1),
        Round(1234.6578, 2),
        Round(1234.6578, 3)
from dual;

select TRUNC(1234.5678, 1),
        TRUNC(1234.5678, 2),
        TRUNC(1234.5678, 3)
from dual;

#지정된 숫자와 가까운 정수를 찾는 함수 CEIL, FLOOR
select CEIL(3.64),
       FLOOR(3.64),
       CEIL(-3.64),
       FLOOR(-3.64)
from dual;

# 나누셈 %
select MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
from dual;

#날짜
select sysdate,
      sysdate - 1 as 어제,
      sysdate + 1 as 내일
from dual;
#3개월 후 날짜 구하기
select sysdate, add_months(sysdate, 3) from dual;

#입사 10주년 되는 사원 데이터 출력하기
select empno, ename, hiredate, add_months(hiredate, 120)
from emp;

#입사 32년 미만인 사원 데이터 출력하기 --> where사용
select empno, ename, hiredate, sysdate from emp
where add_months(hiredate,450) > sysdate;

#sysdate와 add_months 함수를 사용해서 현재 날짜와 6개월 후 날짜를 출력해 봅시다.
select sysdate, add_months(sysdate, -10) from dual;

#두 날짜간의 개월 수 차이를 구하는 함수 months_between
select empno, ename, hiredate, sysdate,
      TRUNC(months_between(hiredate, sysdate)) as MONTHS1,
      TRUNC(months_between(sysdate, hiredate)) as MONTHS2
from emp;

#돌아오는 요일, 달의 마지막날짜 NEXT_DAY, LAST_DAY
select sysdate, 
        next_day(sysdate, '수요일'),
        last_day('22/02/05')
from dual;

#날짜 Round함수
select sysdate,
      round(sysdate, 'CC'),
      round(sysdate, 'YYYY'),
      round(sysdate, 'Q'),
      round(sysdate, 'DDD'),
      round(sysdate, 'HH')
from dual;

select sysdate,
      trunc(sysdate, 'CC'),
      trunc(sysdate, 'YYYY'),
      trunc(sysdate, 'Q'),
      trunc(sysdate, 'DDD'),
      trunc(sysdate, 'HH')
from dual;

#자료형(type)을 변환하는 변환함수
select empno, ename, empno + '500'       # 
from emp where ename=upper('scott');

#문자열과 숫자 더하기
#select 'ABCD' + empno from emp; #Error

#SUBSTR()
#TO_CHAR() 
#날짜형식 패턴을 이용하여 출력 가능
select TO_CHAR(sysdate, 'YYYY MM DD HH24:MI:SS') from dual;

#여러 언어로 날짜(월) 출력
select sysdate,
    TO_CHAR(sysdate, 'MM') as MM,
    TO_CHAR(sysdate,'MON', 'NLS_DATE_LANGUAGE = ENGLISH') as English,
    TO_CHAR(sysdate,'MON', 'NLS_DATE_LANGUAGE = JAPANESE') 
    
from dual;

#sysdate 시간 형식 지정하여 출력
select sysdate, TO_CHAR(sysdate, 'HH:MI:SS PM') from dual;

#숫자형식을 TO_CHAR로 표현해 봅시다.
select sal,
    TO_CHAR(sal, '$999,999')as sal1 ,
    TO_CHAR(sal, 'L999,999') as sal2,
    TO_CHAR(sal, '999,999.00') as sal3,
    TO_CHAR(sal, '000,999,999.00')
from emp;

#TO_NUMBER 문자데이터를 숫자데이터로
select 1300 - '1500',
        '1300' + 1500
from dual;

select TO_NUMBER('888,888','999,999') - TO_NUMBER('333,333', '999,999') from dual;

#문자 데이터를 날짜 데이터로 변환 TO_DATE
select TO_DATE('2018-07-04', 'YYYY-MM-DD'),
    TO_DATE('20180704', 'YYYY-MM-DD')
from dual;


#1981년 6월 1일 이후에 입사한 사원 정보를 출력해 봅시다!!!!
select * from emp
where hiredate > TO_DATE('1981/06/01', 'YYYY/MM/DD');

#DB NULL처리 NVL함수 
#데이터가 NULL 아니면 그대로 반환, NULL이라면 여러분이 지정한 값으로 변환
select empno, ename, sal, comm, sal + comm,
       NVL(comm, 0), sal + NVL(comm, 0)
from emp;

#NVL2함수 지정값 추가
select comm, 
        NVL2(comm, 'O', 'X'),
        NVL2(comm, SAL*12+comm, sal*12)
from emp;

### DECODE 응용 부분
select empno, ename, job, sal,
       DECODE(job, 
              'MANAGER', sal * 1.1,
              'SALESMAN', sal * 1.15,
              'ANALYST', sal,
              sal * 1.03
              ) as 급여
from emp;

#6-49 열 값에 따라 출력 값이 달라지는 CASE
select empno, ename, comm,
    CASE
        WHEN comm IS NULL THEN '해당사항 없음'
        WHEN comm = 0 THEN '수당없음'
        WHEN comm >0 THEN '수당 :' || COMM
    END
from emp;

#연습문제 p174
#1
select empno, 
        RPAD(substr(empno,1,2), 4, '*') as MASKING_EMPNO ,
        ename,
        RPAD(substr(ename,1,1), 4, '*') as MASKING_ENAME
from emp;

#2
select empno, ename, sal,
    trunc(sal / 21.5, 2) as 일당,
    round(sal / 21.5 / 8, 1) as 시급    
from emp;

#3
select empno, ename, hiredate,
       TO_CHAR(next_day(add_months(hiredate, 3), '월요일'), 'YYYY-MM-DD') as R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') as comm
from emp; 

#4
select empno, ename, mgr,
       case
          when mgr is null then '0000'
          when substr(mgr, 1, 2) = '78' then '8888'
          when substr(mgr, 1, 2) = '77' then '7777'
          when substr(mgr, 1, 2) = '76' then '6666'
          when substr(mgr, 1, 2) = '75' then '5555'
          else to_char(mgr)
       end as 변환코드
from emp;

#다중행 함수, 데이터 그룹화
#COUNT, SUM, AVG, MAX, MIN

select sum(sal) from emp;
select COUNT(sal) from emp;
select * from emp;

select sal from emp;
select round(avg(sal), 2) from emp;

#급여 합계 구하기
select sum(distinct sal),
       sum(all sal),
       sum(sal)
from emp;

#30번 부서 인원은??? 
select count(*) from emp
where deptno = 30;

select MAX(sal) from emp where deptno = 20;
select MIN(sal) from emp where deptno = 10;

#입사일이 가장 최신일 출력 부서번호가 20번
select max(hiredate) from emp
where deptno = 10;

#다중행 함수, 데이터 그룹화
#COUNT, SUM, AVG, MAX, MIN
#Group By

select round(avg(sal), 2), deptno from emp
group by deptno;

#부서번호 및 직책별 평균 급여 정렬하기
select deptno, job, avg(sal) from emp
group by deptno, job
order by deptno, job;

#Group by 절에서 조건(WHERE) 검색
select deptno, job, AVG(sal)
from emp
group by deptno, job
HAVING AVG(sal) >= 2000;

#WHERE과 HAVING이 같이 사용가능한가???
#7-23
select deptno, job, avg(sal) from emp
WHERE sal <= 3000
group by deptno, job
HAVING avg(sal) >=2000
order by deptno, job;

#다중행 함수, 데이터 그룹화
#COUNT, SUM, AVG, MAX, MIN (다중행 함수)
#Group By (그룹화)
#Having (조건)

#직업별(job) 연봉
#부서별(dept) 연봉 기타 데이터
#직업테이블(JOBS) 


select count(*), Round(avg(sal),2), deptno from emp
group by deptno
having avg(sal) > 1500
order by deptno;


#다양한 그룹화 함수들
select deptno, job, COUNT(*), MAX(sal), SUM(sal), AVG(sal)
from emp
group by deptno, job
order by job, deptno
;
#ROLLUP
select deptno, job, COUNT(*), MAX(sal), SUM(sal), Round(AVG(sal), 2)
from emp
group by ROLLUP(deptno, job);

#CUBE
select deptno, job, COUNT(*), MAX(sal), SUM(sal), Round(AVG(sal), 2)
from emp
group by CUBE(deptno, job)
order by deptno, job;


#DEPTNO를 먼저 그룹화한 후 Rollup 함수에 job지정하기
select deptno, job, COUNT(*) from emp
group by deptno, ROLLUP(job);

#JOB을 먼저 그룹화한 후 Rollup 함수에 deptno지정하기
select deptno, job, COUNT(*) from emp
group by job, ROLLUP(deptno);

#P201
#GROUPING SET
#컬럼별 그룹화를 통해 결과를 출력함
select deptno, job, count(*) from emp
group by GROUPING SETS(deptno, job)
order by deptno, job;

#7-30 deptno, job 열의 그룹화 결과 여부를 grouping 함수로 확인해 봅시다.
select deptno, job, count(*), max(sal), sum(sal), round(avg(sal),2),
       GROUPING(deptno),
       GROUPING(job)
from emp
group by CUBE(deptno, job)
order by deptno, job;

#7-31
select DECODE(GROUPING(DEPTNO), 1, 'ALL_DEPT', DEPTNO) 부서번호,
       DECODE(GROUPING(JOB), 1, 'ALL_JOB', job) 직업,
       COUNT(*), MAX(SAL)
from emp
group by CUBE(deptno, job)
order by deptno, job;
#7-32 grouping_id

#LISTAGG함수 오라클11g 지원
#그룹에 속해있는 테이터를 가로로 나열하기 위해
#부서별 사원 이름을 가로로 나열
select deptno, LISTAGG(ename, ',')
       WITHIN GROUP(order by sal desc)
from emp 
group by deptno;

#실력을 업그레이드 해주는 함수
#PIVOT, UNPIVOT

#부서별, 직책별 그룹화 최고 급여 데이터 출력
select deptno, job, max(sal) from emp
group by deptno, job
order by deptno, job;

select * from (select deptno, job, sal from emp)
    PIVOT( MAX(sal) FOR DEPTNO IN (10, 20, 30))
order by job;

#3-37
#PIVOT 함수를 사용하여 부서별, 직책별 최고 급여를 2차원 표 형태로 출력하기
select * from (select job, deptno, sal from emp)
   PIVOT( MAX(sal)
             FOR job in ('CLERK', 'SALESMAN', 'PRESIDENT', 'MANAGER', 'ANALYST')
         )
order by deptno
;

#DECODE문을 활용하여 PIVOT 구현
select deptno,
    MAX(DECODE(JOB, 'CLERK', SAL)) as 점원,
    MAX(DECODE(JOB, 'SALESMAN', SAL)) as 판매원
from emp
group by deptno
;

#연습문제
#1
select deptno, Trunc(avg(sal)) 평균급여, MAX(sal) 최고급여, 
      MIN(sal) 최저급여, COUNT(*) 사원수
from emp
group by deptno;

#2
select JOB, count(*)
from emp
group by job
having count(*) >=3;


#3
select to_char(hiredate, 'YYYY') as HIRE_YEAR, 
       deptno, 
       count(*) as CNT 
from emp
group by to_char(hiredate, 'YYYY'), deptno;

#4
select nvl2(comm, 'O', 'X') as EXIST_COMM,
       count(*) as CNT
from emp
group by nvl2(comm, 'O', 'X');

#5
select deptno,
       NVL(to_char(hiredate, 'YYYY'), '1980') as HIRE_YEAR,
       count(*) as CNT,
       max(SAL) as MAX_SAL,
       sum(SAL) as SUM_SAL,
       round(avg(SAL),2) as AVG_SAL
from emp
group by Rollup(deptno, to_char(hiredate, 'YYYY')); 

select * from dept;
desc dept;

select count(*), sum(sal), min(sal), max(sal), avg(sal) from emp;

#Rollup
select deptno, job, count(*) from emp
group by Rollup(deptno, job)
order by deptno, job;
#Cube
select deptno, job, count(*) from emp
group by Cube(deptno, job);


select deptno, job, count(*) from emp
group by deptno, job
HAVING count(*) > 3;


## PIVOT함수
select * from (select deptno, job, sal from emp)
PIVOT ( MAX(sal) for deptno IN (10, 20, 30))
order by job;

#JOIN
#TABLE1 ( EMP )
select * from emp;
#TABLE2 ( DEPT )
select * from dept;

select dept.deptno, ename, job, hiredate, dname, loc from emp, dept
where emp.deptno = dept.deptno
order by deptno;


#기본조인
select * from emp, dept; #테이블1 X 테이블2
#실질적 조인
select * from emp, dept
WHERE emp.deptno = dept.deptno
order by empno; #테이블1의 테이블2확장 
#조인 활용
select empno, ename, dname from emp, dept
WHERE emp.deptno = dept.deptno
order by empno;  


#8-3 테이블 이름을 별칭으로 표현하기
select * from emp e, dept d
where e.deptno = d.deptno
order by empno;

#급여(SAL)가 2000 초과인 사원들의 부서정보 사원정보를 #P239 1번문제
select e.deptno, dname, empno, ename, sal 
from emp e, dept d
where e.deptno = d.deptno and sal > 2000
order by deptno;

#등가조인 ==> INNER JOIN, Simple JOIN
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

#비등가 조인
#TABLE1
SELECT * FROM EMP;
#TABLE2
SELECT * FROM SALGRADE;
#TABLE3 <-- ((비등가 조인))
SELECT * FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

#TABLE4
SELECT ENAME, JOB, SAL, GRADE FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


SELECT * FROM EMP;
#8-8 같은 테이블을 두 번 사용해서 ((자체 조인))
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

#INNER JOIN 해보니 NULL값에 대한 데이터 유실이 생겼다.
#이를 해결한 JOIN ==> 외부조인 OUTER JOIN ==>  Left Join, Right Join

#Left Join
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;

#Right Join
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO
ORDER BY E1.EMPNO;


# ANSI 표준 SQL Join 구문
# NATURAL JOIN
# p232

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
    FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;



#P239
#2
select e.deptno, d.dname, trunc(avg(sal)), max(sal), min(sal), count(*)
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, d.dname;

#3
select d.deptno, dname, empno, ename, job, sal
from emp e, dept d
where e.deptno(+) = d.deptno
order by d.deptno;

#4
select d.deptno, d.dname, 
       e.empno, e.ename, e.mgr, e.sal, e.deptno,
       s.losal, s.hisal, s.grade, 
       e2.empno, e2.ename
from emp e, dept d, salgrade s, emp e2
where e.deptno(+) = d.deptno 
      and e.sal >= s.losal(+) and e.sal <= s.hisal(+)
      and e.mgr = e2.empno(+)
order by d.deptno, d.dname;


#SubQuery
#사원 이름이 Jones인 사원의 급여를 출력해 봅시다.
select sal from emp where ename = upper('jones');
#급여가 $2975 보다 높은 금액을 받는 사원 정보를 출력
select * from emp where sal > 2975;
#서버쿼리를 활용한 합성
select * from emp where sal > (select sal from emp where ename = upper('jones'));

#EMP테이블 사원 이름이 ALLEN인 사원의 추가 수당(comm)보다 많이 받는 사원들은 누구인가요??
#1
select comm from emp where ename = upper('allen');
#2
#select * from emp where comm > ( );
#3
select * from emp 
  where comm > (select comm from emp where ename = upper('allen'));

#실행 결과가 하나인 단일해 서브쿼리
#scott의 입사일
select hiredate from emp where ename=upper('scott');
#scott보다 일찍 입사한 사원은?
select * from emp
where hiredate < ();

#합성
select * from emp
where hiredate < (
        select hiredate from emp 
            where ename=upper('scott')
        )
order by hiredate, ename;

#조인과 서브쿼리를 함께 사용
select trunc(avg(sal)) from emp;
#평균 급여 이상인 20번 부서의 사원 정보
select e.empno, e.ename, e.job, e.sal,
       d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
    and e.deptno = 20
    and e.sal > (select trunc(avg(sal)) from emp);

#9-3 실행 결과가 여러 개인 다중행 서브쿼리
#IN 연산자
select * from emp where deptno in (20, 30);
#각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력하기
select * from emp
where sal IN 
          (select max(sal) from emp group  by deptno);

#ANY
#부서별 최고급여
select max(sal) from emp group  by deptno;
#부서별 최고급여를 받는 사원정보
select * from emp 
where sal = ANY (select max(sal) from emp group  by deptno);

#SOME
select * from emp
where sal = SOME (select max(sal) from emp group  by deptno);

select * from emp
where job = (select job from emp
where ename = upper('ward'));


select e.job, e.empno, e.ename, e.sal,
       d.deptno , d.dname
from emp e, dept d
where e.deptno = d.deptno and job = (select job from emp
where ename = upper('ward'));



#2
select e.empno, e.ename, e.sal,
      d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
and e.sal <= 2500
and e.empno <= 9999
order by e.empno;

#3
select * from emp e, salgrade s
where e.sal between s.losal and s.hisal;

#4, 5
select e1.empno, e1.ename, e1.mgr,
      e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);


#SQL-99
#8-11
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
       DEPTNO, D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

#8-12

#9-13 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력
#1
SELECT SAL FROM EMP WHERE DEPTNO = 30;
#2
SELECT * FROM EMP 
WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);

#9-14 30번 부서 사원들의 최소 급여보다 더 적은 급여를 받는 사원 정보 출력
#1
SELECT SAL FROM EMP WHERE DEPTNO = 30;
#2
SELECT * FROM EMP 
WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

#9-16
#1
SELECT DNAME FROM DEPT WHERE DEPTNO = 10;
#2
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);
#TRUE이면 전체 출력 FALSE이면 출력(x)

#9-4 다중열 서브쿼리 (**)- 중요
#1
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
#2
SELECT * FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

#9-5 인라인 뷰(INLINE VIEW) ==> FROM절에서 사용하는 서브쿼리
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, 
     (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

#WIDTH절 사용하기 ==> INLINE VIEW의 변수화!!!
#테이블 내 데이터 규모가 너무 크거나 현재작업에서 불필요한 컬럼이 많아서 일부
#행과 열만 사용하고자 할때

WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC 
FROM E10, D
WHERE E10.DEPTNO = D.DEPTNO;

#SELECT절에서 서브쿼리 사용가능~!!!
#1
SELECT GRADE FROM SALGRADE;
#2
SELECT EMPNO, ENAME, JOB, SAL,
      (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL),
      DEPTNO,
      (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO)      
FROM EMP E;

#테이블 조작어
DROP TABLE DEPT_TEMP; 

CREATE TABLE DEPT_TEMP 
  AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;
#삭제
DELETE FROM DEPT_TEMP WHERE DEPTNO = 50;
#삽입
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
VALUES (70, 'WEB', NULL);

DROP TABLE EMP_TEMP;
#테이블 구조만 복사
CREATE TABLE EMP_TEMP 
 AS SELECT * FROM EMP WHERE 1 <> 1;

SELECT * FROM EMP_TEMP;

#10-10
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);

#10-12
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(2111, '이순신', 'MANAGER', 9999,
       TO_DATE('07/01/2001', 'DD/MM/YYYY'),
       4000, NULL, 20);

#DEPT_TEMP2 만들기
CREATE TABLE DEPT_TEMP2
 AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP2;
#UPDATE
UPDATE DEPT_TEMP2 SET LOC = 'NEWYORK'
WHERE DEPTNO = 10;

ROLLBACK;
COMMIT;

#10-18
#하나 이상의 데이터를 수정해봅시다.
UPDATE DEPT_TEMP2 
     SET DNAME = 'DATABASE',
         LOC   = 'SEOUL'
WHERE DEPTNO = 40;

SELECT * FROM DEPT_TEMP2;

#급여가 $2500 이상인 사원은 추가수당(COMM)을 $50으로 수정해 주세요. EMP_TEMP 테이블
UPDATE EMP_TEMP
    SET COMM = 50
WHERE SAL >= 2500;

SELECT * FROM EMP_TEMP;


#10-19
#1
SELECT DNAME, LOC FROM DEPT WHERE DEPTNO=40;
#2
UPDATE DEPT_TEMP2
    SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT 
                        WHERE DEPTNO=40)
WHERE DEPTNO =40;

SELECT * FROM DEPT_TEMP2;



#연습문제 p287
CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;?


#1
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC)
VALUES (50, 'ORACLE', 'BUSAN');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC)
VALUES (60, 'SQL', 'ILSAN');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC)
VALUES (70, 'SELECT', 'INCHEON');
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC)
VALUES (80, 'DML', 'BUNDANG');

SELECT * FROM CHAP10HW_DEPT;

#2

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7201, 'TEST_USER1', 'MANAGER', 7788, TO_DATE('2016-01-02', 'YYYY-MM-DD'), 4500, NULL, 50);

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201, TO_DATE('2016-05-31', 'YYYY-MM-DD'), 2700, 300, 60);

SELECT * FROM CHAP10HW_EMP;

#3
UPDATE CHAP10HW_EMP
    SET DEPTNO = 70
WHERE SAL > (SELECT AVG(SAL) FROM CHAP10HW_EMP WHERE DEPTNO = 50);

SELECT * FROM CHAP10HW_EMP;

#4
UPDATE CHAP10HW_EMP
    SET SAL = SAL*1.1, DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM CHAP10HW_EMP WHERE DEPTNO = 60);

SELECT * FROM CHAP10HW_EMP;

#5
SELECT * FROM CHAP10HW_EMP;

DELETE FROM CHAP10HW_EMP
 WHERE EMPNO IN (  
                 SELECT E.EMPNO
                 FROM CHAP10HW_EMP E, CHAP10HW_SALGRADE S
                 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                 AND S.GRADE = 5);

SELECT * FROM CHAP10HW_EMP E, CHAP10HW_SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY GRADE DESC;

#11장 트랜잭션
#DEPT ==> DEPT_TCL
CREATE TABLE DEPT_TCL
 AS SELECT * FROM DEPT;
 
SELECT * FROM DEPT_TCL;

#삽입
INSERT INTO DEPT_TCL VALUES ( 50, 'DATABASE', 'SEOUL');
#수정
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
#삭제
DELETE FROM DEPT_TCL WHERE DNAME='RESEARCH';
#검색
SELECT * FROM DEPT_TCL;

#ROLLBACK
ROLLBACK;
#파일에 저장
COMMIT;

#12장 데이터 정의어 
#12-1
CREATE TABLE EMP_DDL (
    EMPNO        NUMBER(4),
    ENAME        VARCHAR(10),
    JOB          VARCHAR(9),
    MGR          NUMBER(4),
    HIREDATE     DATE,
    SAL          NUMBER(7,2),
    COMM         NUMBER(7,2),
    DEPTNO       NUMBER(2)
);
SELECT * FROM EMP_DDL;

#12-4 테이블의 부분만 복사하여 새 테이블 만들기
CREATE TABLE EMP_DDL_30
    AS SELECT * FROM EMP
       WHERE DEPTNO = 30;
       
SELECT * FROM EMP_DDL_30;

#테이블을 변경하는 ALTER
CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;

#열(컬럼)을 추가해 봅시다
ALTER TABLE EMP_ALTER
 ADD HP VARCHAR2(20);

#HP --> TEL
#RENAME COLUMN TO
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;

SELECT * FROM EMP_ALTER;

#COMM ==> BONUS
ALTER TABLE EMP_ALTER
    RENAME COLUMN COMM TO BONUS;

#컬럼의 자료형 변경==> 컬럼의 형변환
#MODIFY
DESC EMP_ALTER;

ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(4);

#컬럼삭제 DROP COLUMN
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

SELECT * FROM EMP_ALTER;

#테이블 이름변경 RENAME
#RENAME A TO B
RENAME EMP_ALTER TO EMP_RENAME;
SELECT * FROM EMP_RENAME;

#테이블 구조만 남기고 전체 데이터 삭제
#TRUNCATE TABLE
TRUNCATE TABLE EMP_RENAME;
SELECT * FROM EMP_RENAME;

DESC EMP_RENAME;

ALTER TABLE EMP_RENAME
MODIFY EMPNO NUMBER(4);

#연습문제 p324
#1
CREATE TABLE EMP_HW ( 
     EMPNO    NUMBER(4), 
     ENAME    VARCHAR2(10), 
     JOB      VARCHAR2(9), 
     MGR      NUMBER(4), 
     HIREDATE DATE, 
     SAL      NUMBER(7, 2), 
     COMM     NUMBER(7, 2), 
     DEPTNO   NUMBER(2) 
); 

SELECT * FROM EMP_HW;
#2
ALTER TABLE EMP_HW ADD BIGO VARCHAR2(20);

SELECT * FROM EMP_HW;

#3 컬럼 형변환
ALTER TABLE EMP_HW 
MODIFY BIGO VARCHAR2(30);

DESC EMP_HW;
#4
ALTER TABLE EMP_HW 
    RENAME COLUMN BIGO TO REMARK;

#5
INSERT INTO EMP_HW
    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
FROM EMP;

#6
DROP TABLE EMP_HW;

## 규칙에 맞는 순번을 생성하는 작업 ==> 시퀀스
#13-26
#DEPT 테이블을 사용하여 DEPT_SEQUENCE 테이블

CREATE TABLE DEPT_SEQUENCE
 AS SELECT * FROM DEPT WHERE 1 <> 1;

SELECT * FROM DEPT_SEQUENCE;

#SEQUENCE 만들기

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
  INCREMENT BY 10
  START WITH 10
  MAXVALUE 90
  MINVALUE 0
  CACHE 2;

#생성한 시퀀스 쿼리로 확인하기
SELECT * FROM USER_SEQUENCES;

SELECT * FROM DEPT_SEQUENCE;
#13-29 시퀀스를 이용한 데이터 삽입
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE;

#가장 마지막으로 생성된 시퀀스번호 확인하기
SELECT SEQ_DEPT_SEQUENCE.CURRVAL FROM DUAL;

#13-32 시퀀스 옵션 수정
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
  INCREMENT BY 3
  MAXVALUE 99
  CYCLE;

#13-33 시퀀스 수정
SELECT * FROM USER_SEQUENCES;

#시퀀스 삭제
DROP SEQUENCE SEQ_DEPT_SEQUENCE;

select * from tab;

#hr계정에 권한을 부여
GRANT CREATE SYNONYM TO HR;
GRANT CREATE PUBLIC SYNONYM TO HR;

#동의어 생성
#EMP 테이블 동의어 생성
CREATE SYNONYM E FOR EMP;

SELECT * FROM E;


#제약 
#UNIQUE, PRIMARY KEY, FOREIGN KEY


#테이블 생성 제약
CREATE TABLE TABLE_NOTNULL (
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL       VARCHAR2(20)
);
SELECT * FROM TABLE_NOTNULL;

#14-2
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ('TEST_ID_01', NULL, '010-1234-5678');

#14-3
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD)
VALUES ('TEST_ID_01', '1234');

#14-4
UPDATE TABLE_NOTNULL
  SET LOGIN_PWD = NULL
WHERE LOGIN_ID = 'TEST_ID_01';







SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

SELECT * FROM LOCATIONS;

#제약 조건 이름 직접 지정

CREATE TABLE TABLE_NOTNULL2 (
    LOGIN_ID    VARCHAR2(20)  CONSTRAINT TBLNN2_LGNID_NN  NOT NULL,
    LOGIN_PWD   VARCHAR2(20)  CONSTRAINT TBLNN2_LGNPW_NN  NOT NULL,
    TEL         VARCHAR2(20)
);

#이미 지정된 제약조건을 추가하거나 수정해 봅시다.
#14-7 제약조건 추가
SELECT * FROM TABLE_NOTNULL;

ALTER TABLE TABLE_NOTNULL
MODIFY (TEL NOT NULL);

#14-8 TEL 컮럼 NULL제거 -> UPDATE
UPDATE TABLE_NOTNULL
  SET TEL = '010-1234-5678'
WHERE LOGIN_ID = 'TEST_ID_01';

#제약조건 이름지정 후 수정
ALTER TABLE TABLE_NOTNULL2
MODIFY (TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);


#14-11 테이블 구조 확인
DESC TABLE_NOTNULL2;

#14-12 이미 이름이 생성된 제약조건 이름 변경하기
ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;

#14-13 제약조건 삭제
ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT MY_01;

#TABLE_NOTNULL2 TEL 컬럼에 NOT NULL 제약조건을 추가하는 코드를 만드시오.
#1분 복습
DESC TABLE_NOTNULL2;

ALTER TABLE TABLE_NOTNULL2
MODIFY (TEL CONSTRAINT MY_01 NOT NULL);

#14-14
CREATE TABLE TABLE_UNIQUE (
    LOGIN_ID VARCHAR2(20) UNIQUE,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);

DESC TABLE_UNIQUE;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

SELECT * FROM TABLE_UNIQUE;

#14-16
INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ( 'TEST_ID_03', 'PWD01', '010-1234-5678');

INSERT INTO TABLE_UNIQUE (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ( NULL, 'PWD01', '010-1234-5678');

#14-4 유일하게 하나만 있는 값 UNIQUE, NOT NULL ==> PRIMARY KEY
DROP TABLE TABLE_PK;
#14-32
CREATE TABLE TABLE_PK2(
    LOGIN_ID    VARCHAR(20) CONSTRAINT TBLPK2_LGNID_PK    PRIMARY KEY,
    LOGIN_PWD   VARCHAR(20) CONSTRAINT TBLPK2_LGNPW_NN    NOT NULL,
    TEL         VARCHAR2(20)
);
DESC TABLE_PK;

SELECT * FROM TABLE_PK2;

INSERT INTO TABLE_PK2 (LOGIN_ID, LOGIN_PWD, TEL)
VALUES ( NULL, 'PWD01', '010-1234-5678');



#14-30 생성한 기본키 확인하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_PK%';




#한발 더 나가기
CREATE TABLE TABLE_PK3(
    LOGIN_ID    VARCHAR(20),
    LOGIN_PWD   VARCHAR(20),
    TEL         VARCHAR2(20),
    PRIMARY KEY(LOGIN_ID),
    CONSTRAINT TBLPK2_LGNPW_NN2 UNIQUE (LOGIN_PWD)
);

#다른 테이블과 관계 FOREIGN KEY

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP', 'DEPT');

SELECT * FROM DEPT;
SELECT * FROM EMP;

DESC EMP;

#14-38 FK참조하는 컬럼에 존재하지 않는 데이터 입력하기
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (9999, '홍길동', 'CLERK', '7788', TO_DATE('2017/04/30','YYYY/MM/DD'), 1200, NULL, 30);

DELETE FROM EMP WHERE ENAME = '홍길동';
COMMIT;

#14-39
#DEPT_FK 테이블 생성
DROP TABLE DEPT_FK;
CREATE TABLE DEPT_FK (
    DEPTNO  NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC   VARCHAR2(13)
);
DROP TABLE EMP_FK;
CREATE TABLE EMP_FK (
    EMPNO   NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME   VARCHAR2(10),
    JOB     VARCHAR2(9),
	MGR     NUMBER(4),
	HIREDATE DATE,
	SAL     NUMBER(7,2),
	COMM    NUMBER(7,2),
    DEPTNO  NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO) ON DELETE CASCADE
);

CREATE TABLE EMP_FK (
    EMPNO   NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME   VARCHAR2(10),
    JOB     VARCHAR2(9),
	MGR     NUMBER(4),
	HIREDATE DATE,
	SAL     NUMBER(7,2),
	COMM    NUMBER(7,2),
    DEPTNO  NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO) ON DELETE SET NULL
);


SELECT * FROM EMP_FK;
SELECT * FROM DEPT_FK;

#14-41  
#14-42 DEPT_FK
INSERT INTO DEPT_FK
VALUES(10, 'TEST_DNAME', 'TEST_LOC');

#14-43 EMP_FK
INSERT INTO EMP_FK
VALUES (9999, '홍길동', 'CLERK', '7788', TO_DATE('2017/04/30','YYYY/MM/DD'), 1200, NULL, 10);

SELECT * FROM EMP_FK;
SELECT * FROM DEPT_FK;

DELETE FROM DEPT_FK
WHERE DEPTNO = 10;

#14-45 데이터 형태와 범위를 정하는 CHECK
DROP TABLE TABLE_CHECK;
CREATE TABLE TABLE_CHECK(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK (LENGTH(LOGIN_PWD) > 3),
    TEL VARCHAR2(20) DEFAULT '010-1111-1111'
);
SELECT * FROM TABLE_CHECK;
#14-46 입력
INSERT INTO TABLE_CHECK (LOGIN_ID, LOGIN_PWD)
VALUES ('TEST_ID1', '1234');
#제약조건 확인
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE 'TABLE_CHECK';


#P394 연습문제 DEPT_CONST테이블과 EMP_CONST테이블 만들어라

CREATE TABLE DEPT_CONST (
    DEPTNO  NUMBER(2)   CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME   VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC     VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL
);

CREATE TABLE EMP_CONST (
    EMPNO    NUMBER(4)      CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY, 
    ENAME    VARCHAR2(10)   CONSTRAINT EMPCONST_ENAME_NN NOT NULL, 
    JOB      VARCHAR2(9), 
    TEL      VARCHAR2(20)   CONSTRAINT EMPCONST_TEL_UNQ UNIQUE, 
    HIREDATE DATE, 
    SAL      NUMBER(7, 2)   CONSTRAINT EMPCONST_SAL_CHK CHECK (SAL BETWEEN 1000 AND 9999), 
    COMM     NUMBER(7, 2), 
    DEPTNO   NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST (DEPTNO) 
);

#제약조건 확인
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('DEPT_CONST', 'EMP_CONST');


#사용자 만들기
CREATE USER ORCLSTUDY IDENTIFIED BY ORACLE;
#권한부여
GRANT CREATE SESSION TO ORCLSTUDY;

#모든 사용자 조회
SELECT * FROM ALL_USERS;
SELECT * FROM DBA_USERS;
SELECT * FROM DBA_OBJECTS;

#PL/SQL 기초
SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, PL/SQL!');
END;
/

CREATE TABLE STUDENT_BY_COURSE (
	학생번호	NUMBER(5)	PRIMARY KEY,
	이름	VARCHAR2(20)	NOT NULL,
	나이	NUMBER(3),
	과정명	VARCHAR2(30),
	대학교	VARCHAR2(20),
	전공	VARCHAR2(20),
	이메일	VARCHAR2(30),
	전화번호	VARCHAR2(13),
	특징	VARCHAR2(100),
	상담	VARCHAR2(200)	
);

SELECT * FROM STUDENT_BY_COURSE;

INSERT INTO STUDENT_BY_COURSE
VALUES (STUDENT_SEQ.NEXTVAL, '홍길동', 20, '스마트팩토리', '안동대', '컴퓨터공학', 
        'honggil@gmail.com', '010-1111-1111', '아버지를 아버지라 부르지 못한다', '호부호형을 명했다');
INSERT INTO STUDENT_BY_COURSE
VALUES (STUDENT_SEQ.NEXTVAL, '이순신', 45, '해전전문가', '통영대', '전쟁학', 
        'leesunsin@a.com', '010-2222-2222', '나의 죽음을 알리지 마라', '전쟁이 끝날때까지 죽음을 알리지 않았다');
INSERT INTO STUDENT_BY_COURSE
VALUES (STUDENT_SEQ.NEXTVAL, '광개토', 37, '전쟁전문가', '국내성대', '전쟁학',
        'kwanggaeto@a.com', '010-3333-3333', '아들 걱정이 많다', '아들 이름이 장수인데 걱정은 기우로 보인다.');

DESC EMP;
commit;

select * from emp;
select sal, deptno, sal + deptno from emp;

select sum(sal), sum(deptno), sum(sal) + sum(deptno)
from emp;

SELECT STUDENT_SEQ.CURRVAL FROM DUAL; 

DESC STUDENT_BY_COURSE;
SELECT * FROM STUDENT_BY_COURSE 
WHERE 학생번호 = STUDENT_SEQ.NEXTVAL;

SELECT * FROM STUDENT_BY_COURSE 
WHERE 학생번호 = 3;


CREATE TABLE MORDER (
    ID NUMBER(3) PRIMARY KEY,
    ORDERDATE DATE,
    CNT NUMBER(5)
);

SELECT * FROM EMP;


CREATE SEQUENCE  STUDENT_SEQ2 
	MINVALUE 1 
	MAXVALUE 99999 
	INCREMENT BY 1 
	START WITH 1 
	CACHE 2 
	NOORDER  
	NOCYCLE ;
drop sequence student_seq2;

SELECT * FROM STUDENT_BY_COURSE;
SELECT STUDENT_SEQ.NEXTVAL FROM DUAL;
SELECT STUDENT_SEQ.CURRVAL FROM DUAL;

###########################################

select * from emp;

select hiredate, Round(deptno/3,2) as perc from emp;
select to_char(hiredate) from emp;
select Round(deptno/3,2) as perc from emp;

SELECT STUDENT_SEQ.CURRVAL FROM DUAL;

#Student Temp 테스트 테이블 만들기
CREATE TABLE STUDENT_TEMP (
    ID  NUMBER(3) PRIMARY KEY,
    NAME VARCHAR2(20),
    PNUMBER VARCHAR2(30)
);
COMMIT;
select * from student_temp;
INSERT INTO STUDENT_TEMP (ID, NAME, PNUMBER)
VALUES (100, '고유진', '010-3333-3333');
ROLLBACK;

select * from student_by_course;
delete from student_by_course where 나이=45;

select * from emp where empno = 7839;

drop table TEST29_1;
create table TEST29_1 (
 COL varchar2(10)
)
desc TEST29_1;

insert into TEST29_1 VALUES ('1');
insert into TEST29_1 VALUES ('2');
insert into TEST29_1 VALUES ('3');
insert into TEST29_1 VALUES ('4');
select * from TEST29_1;

drop table TEST29_2;
create table TEST29_2 (
 COL varchar2(10)
);
insert into TEST29_2 VALUES ('2');
insert into TEST29_2 VALUES (NULL);
select * from TEST29_2;

delete from test29_2 where col == NULL;
select col from test29_2;

select count(*) from test29_1
where test29_1.COL NOT IN (select col from test29_2);



#문자시퀀스 테스트
drop table product;
create table product(
    code varchar2(5) primary key,
    name varchar2(100) not null,
    price number not null,
    qty number not null
);
desc product;
drop sequence productSeq;
create sequence productSeq;
select 'AA'||trim(to_char(productSeq.nextval,'000')) from dual;

insert into product(code, name, price, qty) 
values('AA'||trim(to_char(productSeq.nextval,'000')),'상품명',1000,10);

insert into product(code, name, price, qty) 
values('AA'||trim(to_char(productSeq.nextval,'000')),'상품명2',3000,10);

select * from product;

select * from emp_temp;
desc emp_temp;



select deptno from dept;

select mgr-sal*3 from emp;

select mgr, 
      case when mgr-sal*3 < 0  then 0
      else sal
      end as P1
from emp
where P1 > 0;










