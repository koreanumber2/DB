CREATE TABLE new_table(no NUMBER(3),name VARCHAR2(10),birth DATE);
desc new_table;
select * from new_table;
CREATE TABLE tt02 (no number(3,1)default 0,name varchar2(10) default 'NO Name',hiredate date default sysdate);
insert into tt02(no) VALUES(1);
select * from tt02;
CREATE TABLE �ѱ����̺�(�÷�1 number,�÷�2 varchar2(10),�÷�3 date);
select * from �ѱ����̺�;
select * from dept2;
CREATE TABLE dept3 as select * from dept2;
select * from dept3;
CREATE TABLE dept4 AS select dcode,dname from dept2;
select * from dept4;
create table dept5 as select * from dept2 where 1=2;
select * from dept5;
create table dept6 as select dcode,dname from dept2 where dcode in(1000,1001,1002);
select * from dept6;




