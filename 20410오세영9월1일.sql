--3�� �������Լ� ��������
--1) emp ���̺��� ����Ͽ� ��� �߿��� �޿�(sal)�� ���ʽ�(comm)�� ��ģ �ݾ��� ���� ���� ���� ���� ���� ���, ��ձݾ��� ���ϼ���.
--��, ���ʽ��� ���� ���� ���ʽ��� 0 ���� ����ϰ� ��� �ݾ��� ��� �Ҽ��� ù° �ڸ������� ������ �ϼ���.
select * from emp;

--2) student ���̺��� birthday Į���� �����ؼ� �Ʒ��� ���� ������ ���� �ڼ��� ����ϼ���.

select count(*)||'EA' "TOTLE",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'01',0)) || 'EA' "JAN",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'02',0)) || 'EA' "FEB",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'03',0)) || 'EA' "MAR",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'04',0)) || 'EA' "APR",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'05',0)) || 'EA' "MAY",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'06',0)) || 'EA' "JUN",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'07',0)) || 'EA' "JUL",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'08',0)) || 'EA' "AUG",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'09',0)) || 'EA' "SEP",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'10',0)) || 'EA' "OCT",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'11',0)) || 'EA' "NOV",
       COUNT(DECODE(TO_CHAR(BIRTHDAY,'MM'),'12',0)) || 'EA' "DEC"
    FROM STUDENT;

--3) Student ���̺��� tel Į���� �����Ͽ� �Ʒ��� ���� ������ �ο����� ����ϼ���.
--��, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM���� ����ϼ���.

select count(*) "TOTAL", 
        COUNT(decode(substr(tel,1,instr(tel,')')-1),'02',0)) "SEOUL",
        COUNT(decode(substr(tel,1,instr(tel,')')-1),'031',0)) "GYEONGGI",
        COUNT(decode(substr(tel,1,instr(tel,')')-1),'051',0)) "BUSAN",
        COUNT(decode(substr(tel,1,instr(tel,')')-1),'052',0)) "ULSAN",
        COUNT(decode(substr(tel,1,instr(tel,')')-1),'053',0)) "DAEGU",
        COUNT(decode(substr(tel,1,instr(tel,')')-1),'055',0)) "GYEONGNAM"
    from student;

--4) ���� emp ���̺� �Ʒ��� �ΰ��� �����͸� �Է��Ͻ� �� �۾��ϼ���.
--Emp ���̺��� ����Ͽ� �Ʒ��� ȭ��� ���� �μ����� ���޺��� �޿� �հ� ����� ����ϼ���.

select deptno, sum(decode(job,'CLERK',sal,0)) "CLERK",
               sum(decode(job,'MANAGER',sal,0)) "MANAGER",
               sum(decode(job,'PRESIDENT',sal,0)) "PRESIDENT",
               sum(decode(job,'ANALYST',sal,0)) "ANALYST",
               sum(decode(job,'SALESMAN',sal,0)) "SALESMAN",
               sum(sal) "TOTAL"
    from emp group by deptno order by deptno;

--5) emp ���̺��� ����Ͽ� �������� �޿��� ��ü �޿��� ���� �޿� �ݾ��� �Ʒ��� ������ ����ϼ���.
-- ��, �޿��� ������������ �����ؼ� ����ϼ���.

select deptno, ename, sal, sum(sal) over(order by sal) total from emp;
--6) fruit ���̺��� �Ʒ��� ���� ���·� ����ϼ���.

select max(sum(decode(name,'apple',100))) APPLE,
       min(sum(decode(name,'grape',200))) "GRAPE",
       max(sum(decode(name,'orange', 300))) ORANGE
      from fruit group by name;

--7) student ���̺��� Tel Į���� ����Ͽ� �Ʒ��� ���� ������ �ο����� ��ü ��� �����ϴ� ������ ����ϼ���.

select count(*)||'EA('||count(*)/count(*)*100||'%)' TOTAL , 
       count(decode(substr(tel,1,instr(tel,')')-1),'02',0))||'EA('||
       count(decode(substr(tel,1,instr(tel,')')-1),'02',0))/count(*)*100 ||'%)' SEOUL 
       from student;

--8) emp ���̺��� ����Ͽ� �Ʒ��� ���� �μ����� �޿� �����հ谡 �������� ����ϼ���.( �� �μ� ��ȣ�� �������� ����ϼ���. )

select deptno, ename, sal, sum(sal) over(partition by deptno order by sal) TOTAL from emp;

--9) emp ���̺��� ����Ͽ� �Ʒ��� ���� �� ����� �޿����� ��ü ���� �޿� �Ѿ׿��� ��%�� ������ �����ϴ��� ����ϼ���.
--��, �޿� ������ ���� ����� ���� ��µǵ��� �ϼ���.

select deptno, ename, sal, sum(sal) over(),
      round(sal/sum(sal) over()*100,2) "TOTAL_SAL" from emp group by deptno, ename, sal order by 5 desc;

--10)emp ���̺��� ��ȸ�Ͽ� �Ʒ��� ���� �� �������� �޿��� �ش� �μ� �հ�ݾ׿��� ��%�� ������ �����ϴ����� ����ϼ���.
--��, �μ� ��ȣ�� �������� ������������ ����ϼ���.
select deptno, ename,sal, sum(sal) over(partition by deptno) "SUM_DEPT",
       round( sal/sum(sal) over(partition by deptno)*100,2) "%" from emp  
       order by 1,2;

--11) loan ���̺��� ����Ͽ� 1000�� ������ ���� ������ ����ϵ� ��������, ���� �����ڵ�, ����Ǽ�, ���� �Ѿ�, ���� ����ݾ��� �Ʒ��� ���� ����ϼ���.

select l_date "��������", l_code ���������ڵ�, l_qty ����Ǽ�, l_total �����Ѿ�,
     sum(l_total) over(order by l_date) ��������ݾ�
     from loan where l_store=1000;

--12) loan ���̺��� ����Ͽ� ��ü ������ ���� �����ڵ�, ���� ����, ��������, ����Ǽ�, ������� ���� �ڵ�� ���� �������� ���� �հ踦 ���ϼ���.

select l_code ���������ڵ� , l_store ��������, l_date ��������, l_qty ����Ǽ�,l_total �����, 
      sum(l_total) over(partition by l_code, l_store order by l_date) ��������ݾ� 
      from loan;

--13) loan ���̺��� ��ȸ�Ͽ� 1000�� ������ ���� ������ ���� �ڵ庰�� ���ļ� ��������, ���� �����ڵ�, ����Ǽ�, ���� �Ѿ�, �ڵ庰 ���� ����ݾ��� �Ʒ��� ���� ����ϼ���.

select l_date ��������, l_code ���ⱸ���ڽ�, l_qty ����Ǽ�, l_total �����Ѿ�,
     sum(l_total) over(partition by l_code order by l_total) �ڵ庰��������ݾ� 
     from loan where l_store=1000;

--14) professor ���̺��� �� �������� �޿��� ���ϰ� �� ������ �޿����� ��ü ������ �޿� �հ迡�� �����ϴ� ������ ����ϼ���.

select deptno, name, pay,
   sum(pay) over() TOTAL_PAY, 
   round(pay/sum(pay) over()*100,2) "RATIO %" from professor;

--15) professor ���̺��� ��ȸ�Ͽ� �а� ��ȣ, ������, �޿�, �а��� �޿� �հ踦 ���ϰ� �� ������ �޿��� �ش� �а��� �޿� �հ迡�� �����ϴ� ������ ����ϼ���.

select deptno , name, pay, 
    sum(pay) over(partition by deptno) total_deptno,
    round(pay/sum(pay) over(partition by deptno)*100,2) "ratio(%)"
   from professor order by 1,2;