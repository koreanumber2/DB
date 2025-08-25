


select count(*)||'EA('||count(*)/count(*)*100||'%)'TOTAL,
    count(decode(substr(tel,1,instr(tel,')')-1),'02',0))||'EA('||
    count(decode(substr(tel,1,instr(tel,')')-1),'02',0))/count(*)*100||'%)'SEOUL
    count(decode(substr(tel,1,instr(tel,')')-1),'031',0))/count(*)*100||'%)'GYEONGGI
    count(decode(substr(tel,1,instr(tel,')')-1),'051',0))/count(*)*100||'%)'BUSAN
    count(decode(substr(tel,1,instr(tel,')')-1),'052',0))/count(*)*100||'%)'ULSAN
    count(decode(substr(tel,1,instr(tel,')')-1),'053',0))/count(*)*100||'%)'DAEGU
    count(decode(substr(tel,1,instr(tel,')')-1),'055',0))/count(*)*100||'%)'GYEONGNAM
    from student;


select * from emp;
select deptno,ename,sal,sum(sal)over(partition by deptno order by sal)TOTAL
    from emp;
    
select deptno,ename,sal,sum(sal)over()from emp group by deptno,ename,sal;
select deptno,ename,sal,sum(sal)over(),
round(sal/sum(sal)over()*100,2)"TOTAL_SAL"from emp
group by deptno,ename,sal order by 5 desc;

select deptno,ename,sal,sum(sal)over(partition by deptno)"SUM_DEPT",
round((sal/sum(sal)over(partition by deptno))*100,2)"%"from emp order by 1,2;

select deptno,ename,sal,sum(sal)over(partition by deptno)"SUM_DEPT",
round(ratio_to_report(sal)over(partition by deptno)*100,2)"%"from emp order by 1,2 desc;

select * from loan where l_store=1000 and l_code=100;
select l_date "대출일자",l_code 대출종목코드,l_qty 대출건수,l_total 대출총액,
sum(l_total)over(order by l_date)누적대출금액
from loan where l_store=1000;

select l_code 대출종목코드,l_store 대출지점,l_date 대출일자,l_qty 대출건수,l_total 대출액,
sum(l_total)over(partition by l_code,l_store order by l_date)누적대출금액
from loan;

select l_date 대출일자,l_code 대출구분코스,l_qty 대출건수,l_total 대출금액,
sum(l_total)over(partition by l_code order by l_total) 코드별누적대출금액
from loan where l_store=1000 group by l_date,l_code,l_qty,l_total;


















