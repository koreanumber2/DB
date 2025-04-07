select * from student;
select name ||'"s ID :'||ID||',weight is '||weight||'Kg' from student;
select * from emp;
select ename ||'('||job||'),'||ename||'"'||job||'"'from emp;
select ename||'"s sal is $'||sal from emp;
select empno , ename from emp where empno = 7900;
select empno , ename, sal from emp where sal<1000;
select ename , sal , deptno from emp where deptno = 10;
select ename , sal+100 , deptno from emp where deptno = 10;




