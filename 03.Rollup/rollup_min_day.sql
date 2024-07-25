select to_char(rollup('min', 5, time, '2023-07-01')) as time, avg(value), max(value) from machroll
where name = 'pneumatic' and time between TO_DATE('2023-07-01 13:00:00') AND TO_DATE('2023-07-01 13:59:59') group by time order by time;

select to_char(rollup('hour', 4, time, '2024-01-01')) as time, min(value), sumsq(value) from machroll 
where name = 'pneumatic' and time between TO_DATE('2024-01-01') AND TO_DATE('2024-01-01 23:59:59') 
group by time order by time;

select to_char(rollup('day', 3, time, '2024-05-01')) as time, first(time,value), last(time,value) from machroll 
where name = 'pneumatic' and time between TO_DATE('2024-05-01') AND TO_DATE('2024-05-31 23:59:59') 
group by time order by time;