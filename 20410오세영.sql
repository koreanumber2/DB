select * from dept7;

create table dept7
as
select * from dept2;
--구조보기
desc dept7;
alter table dept7 add(location varchar2(10));

alter table dept7 rename column location to loc;

rename table dept7 to dept6;

alter table dept7 drop column location cascade constraints;








































