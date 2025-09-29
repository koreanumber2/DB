select e.empno,e.ename,d.dname from emp e, dept d where e.deptno = d.deptno;
select * from emp;
select * from dept;

select * from student;
select * from department;
--1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 학생이름, 1 전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.
 
select name stu_name,deptno1,dname dept_name from student s ,department d where d.deptno=s.deptno1;
 
--2. emp2 테이블과 p_grade 테이블을 조회하여 현재 직급이 있는 사원의 이름과 직급, 현재 연봉, 해당 직급의 연봉의 하한금액과 상한 금액을 아래 결과 화면과 같이 출력하세요.

select name,e2.position,pay,s_pay low_pay,e_pay high_pay from emp2 e2,p_grade p where e2.position=p.position;
select * from emp2;
select * from p_grade;
   
--3. Emp2 테이블과 p_grade 테이블을 조회하여 사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요. 
--예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.  나이는 오늘(sysdate)을 기준으로 하되 trunc 로 소수점 이하는 절삭해서 계산하세요.

select name,trunc(months_between(sysdate,e2.birthday)/12)as "age", e2.position as "curr_position",p.position from emp2 e2,p_grade p 
where trunc(months_between(sysdate,e2.birthday)/12) between p.s_age and p.e_age;

--4 . customer 테이블과 gift 테이블을 Join하여 고객이 자기 포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때,
--Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.

select * from customer;
select * from gift;
select c.gname,c.point,g.gname from customer c,gift g where g.g_start<=c.point and g.gname='Notebook';

--5. professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요. 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.  

select * from professor;
select p1.profno,p1.name,p1.hiredate,count(nvl2(p2.profno,p1.profno,null)) as count from professor p1, professor p2 where p1.hiredate>p2.hiredate(+) group by p1.profno,p1.name,p1.hiredate order by 3;

--6. emp 테이블에서 사원번호, 사원이름, 입사일, 자신보다  먼저 입사한 사람 인원수를 출력하세요. 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

select * from emp;
select e1.empno,e1.ename,e1.hiredate,count(e2.empno) from emp e1, emp e2 where e1.hiredate>e2.hiredate(+) group by e1.empno,e1.ename,e1.hiredate order by 4;