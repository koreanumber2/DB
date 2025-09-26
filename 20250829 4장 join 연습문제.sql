--4�� JOIN ��������
--�����
--�� 1) emp ���̺�� dept ���̺��� ��ȸ�Ͽ� �Ʒ��� ���� ����ϼ���.

--�� 2) �л� ���̺� (student) �� ���� ���̺� (professor) �� join �Ͽ� �л��� �̸��� ����������ȣ, �������� �̸��� ����ϼ���.


--�� 3) �л� ���̺�(student)�� �а� ���̺�(department) , ���� ���̺�(professor) �� Join�Ͽ� �л��� �̸��� �л��� �а��̸�, �л��� �������� �̸��� ����ϼ���.

--������
--�� 1) Custormer ���̺�� gift ���̺��� Join�Ͽ� ������ ���ϸ��� ����Ʈ�� ��ȸ�� �� �ش� ���ϸ��� ������ ���� �� �ִ� ��ǰ�� ��ȸ�Ͽ� ���� �̸��� ���� �� �ִ� ��ǰ ���� �Ʒ��� ���� ����ϼ���.


--�� 2) Student ���̺�� score ���̺� , hakjum ���̺��� ��ȸ�Ͽ� �л����� �̸��� ������ ������ ����ϼ���.


--outer join
--�� 1 ) Student ���̺�� Professor ���̺��� Join�Ͽ� �л��̸��� �������� �̸��� ����ϼ���.
--�� ���������� �������� ���� �л��� ��ܵ� �Բ� ����ϼ���.


--�� 2 ) Student ���̺�� Professor ���̺��� Join�Ͽ� �л��̸��� �������� �̸��� ����ϼ���.
--�� �����л��� �������� ���� ������ ��ܵ� �Բ� ����ϼ���.

--�� 3 ) Student ���̺�� Professor ���̺��� Join�Ͽ� �л��̸��� �������� �̸��� ����ϼ���.
--�� �����л��� ���� �� �� ���� ��ܰ� ���� ������ ���� �ȵ� �л� ����� �Ѳ����� ����ϼ���.

--4�� JOIN ��������
--1. �л� ���̺� (student) �� �а� ���̺� (department) ���̺��� ����Ͽ� �л��̸�, 1 �����а���ȣ(deptno1) , 1���� �а� �̸��� ����ϼ���.
 
select name stu_name,deptno1,dname dept_name from student s ,department d where d.deptno=s.deptno1;
 
--2. emp2 ���̺�� p_grade ���̺��� ��ȸ�Ͽ� ���� ������ �ִ� ����� �̸��� ����, ���� ����, �ش� ������ ������ ���ѱݾװ� ���� �ݾ��� �Ʒ� ��� ȭ��� ���� ����ϼ���.

select name,e2.position,pay,s_pay low_pay,e_pay high_pay from emp2 e2,p_grade p where e2.position=p.position;

   
--3. Emp2 ���̺�� p_grade ���̺��� ��ȸ�Ͽ� ������� �̸��� ����, ���� ���� , ���� ���� �� ����ϼ���. 
--���� ������ ���̷� ����ϸ� �ش� ���̰� �޾ƾ� �ϴ� ������ �ǹ��մϴ�.  ���̴� ����(sysdate)�� �������� �ϵ� trunc �� �Ҽ��� ���ϴ� �����ؼ� ����ϼ���.

select name,trunc(months_between(sysdate,e2.birthday)/12)as "age", e2.position as "curr_position",p.position from emp2 e2,p_grade p 
where trunc(months_between(sysdate,e2.birthday)/12) between p.s_age and p.e_age;

--4 . customer ���̺�� gift ���̺��� Join�Ͽ� ���� �ڱ� ����Ʈ���� ���� ����Ʈ�� ��ǰ �� �Ѱ����� ������ �� �ִٰ� �� ��,
--Notebook �� ������ �� �ִ� ����� ����Ʈ, ��ǰ���� ����ϼ���.

select c.gname,c.point,g.gname from customer c,gift g where g.g_start<=c.point and g.gname='Notebook';

--5. professor ���̺��� ������ ��ȣ, �����̸�, �Ի���, �ڽź��� �Ի��� ���� ��� �ο����� ����ϼ���. �� �ڽź��� �Ի����� ���� ������� ������������ ����ϼ���.  

select * from professor;
select p1.profno,p1.name,p1.hiredate,count(nvl2(p2.profno,p1.profno,null)) as count from professor p1, professor p2 where p1.hiredate>p2.hiredate(+) group by p1.profno,p1.name,p1.hiredate order by 3;

--6. emp ���̺��� �����ȣ, ����̸�, �Ի���, �ڽź���  ���� �Ի��� ��� �ο����� ����ϼ���. �� �ڽź��� �Ի����� ���� ������� ������������ ����ϼ���.

select * from emp;
select e1.empno,e1.ename,e1.hiredate,count(e2.empno) from emp e1, emp e2 where e1.hiredate>e2.hiredate(+) group by e1.empno,e1.ename,e1.hiredate order by 4;
