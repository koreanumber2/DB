select * from dept;--1
select * from emp;

select job,empno,ename,hiredate from emp;--2

select distinct job from emp;--3

select ename,sal from emp where sal>=2850;--4

select ename,deptno from emp where empno=7566;--5

select ename,sal from emp where sal not between 1500 and 2850;--6

select ename,job,hiredate from emp where hiredate between '1981/2/20' and '1981/5/1' order by hiredate;--7

select ename,job,hiredate from emp where deptno between 10 and 30 order by ename;--8

select ename "Employee", sal "Monthly Salary" from emp where deptno in(10,30) and sal>1500;--9

























