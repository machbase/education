select name, row_count from v$tag_stat order by 1;

select name, count(*) from tag group by name order by 1;

select * from tag where name = 'use' and 
time = ( select recent_row_time from v$tag_stat where name = 'use');

