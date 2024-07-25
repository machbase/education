drop table EQPT_A cascade;
drop table EQPT_B cascade;

create tag table if not exists EQPT_A (name varchar(20) primary key, time datetime basetime, value double summarized) tag_partition_count=1;
create tag table if not exists EQPT_B (name varchar(20) primary key, time datetime basetime, value double summarized) tag_partition_count=1;


select to_char(min(time)), to_char(max(time)) from EQPT_A;
select count(*) from EQPT_A;
select name, to_char(time), value from EQPT_A limit 5;



select to_char(min(time)), to_char(max(time)) from EQPT_B;
select count(*) from EQPT_B;
select name, to_char(time), value from EQPT_B limit 5;



