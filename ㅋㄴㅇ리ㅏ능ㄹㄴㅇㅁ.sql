create table t_readonly (no number, name varchar2(10));
select * from t_readonly;
alter table t_readonly read only;
insert into t_readonly values(2,'BBB');
alter table t_readonly read write;
create table vt1 (col1 number,col2 number,col3 number generated always as (col1+col2));
insert into vt1 values(1,2,3);