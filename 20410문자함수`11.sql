select * from emp;
select ename,initcap(ename)"INITCAR" from emp where deptno=10;
select ename,lower(ename)"LOWER",upper(ename)"UPPER" from emp;
select ename,lower(ename)"LOWER",upper(ename)"UPPER" from emp where deptno=10;
select ename,length(ename),lengthb(ename) from emp where deptno=20;
select 'ȫ�浿',length('ȫ�浿'),lengthb('ȫ�浿') from dual;
select substr('abcde',3,2)"3,2",substr('abcde',-3,2), substr('abcde',-3,4) from dual;
select name,substr(jumin,3,4)-1 "Birthday-1" from student where deptno1=101;
select 'A-B-C-D',instr('A-B-C-D','-',1,3)"INSTR" from dual;
select name,tel,instr(tel,'3'),profno from student where deptno1=101;




    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    