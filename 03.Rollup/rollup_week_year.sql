select to_char(rollup('week', 2, time, '2023-07-02'), 'YYYY-MM-DD') as time, avg(value) from machroll 
where name = 'pneumatic' and time between TO_DATE('2023-07-02 00:00:00') AND TO_DATE('2023-09-02 23:59:59') 
group by time order by time;

select to_char(rollup('month', 3, time, '2023-07-01')) as time, sum(value), count(value) from machroll 
where name = 'pneumatic' and time between TO_DATE('2023-07-01') AND TO_DATE('2024-06-30 23:59:59') 
group by time order by time;

select to_char(rollup('year', 1, time, '2023-07-01')) as time, min(value), max(value) from machroll 
where name = 'pneumatic' and time between TO_DATE('2022-07-01') AND TO_DATE('2024-06-30 23:59:59') 
group by time order by time;