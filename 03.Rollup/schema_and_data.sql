drop table machroll cascade;

create tag table if not exists machroll ( name varchar(20) primary key, time datetime basetime,value double summarized) 
with rollup(min) extension tag_partition_count=1;

exec rollup_force(_machroll_rollup_hour);

select name, to_char(min_time), to_char(max_time) from v$machroll_stat;

select count(*) from machroll;

select name, to_char(time), value from machroll limit 10;

select /*+ SCAN_BACKWARD(machroll) */ name, to_char(time), value from machroll limit 10;