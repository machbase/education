backup database  FROM TO_DATE('2024-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS')
                 TO TO_DATE('2024-03-31 23:59:59','YYYY-MM-DD HH24:MI:SS') into disk='/backup/20240331';
                         
delete from EQPT_A before TO_DATE('2024-03-31 23:59:59','YYYY-MM-DD HH24:MI:SS');
delete from EQPT_B before TO_DATE('2024-03-31 23:59:59','YYYY-MM-DD HH24:MI:SS');



select to_char(min(time)), to_char(max(time)) from EQPT_A;
select count(*) from EQPT_A;

select to_char(min(time)), to_char(max(time)) from EQPT_B;
select count(*) from EQPT_B;



mount database '/backup/20240331' to mountdb;

-- table A 
select count(*) from EQPT_A;
select count(*) from mountdb.sys.EQPT_A;
select to_char(min(time)), to_char(max(time)) from EQPT_A;
select to_char(min(time)), to_char(max(time)) from mountdb.sys.EQPT_A;

-- table B
select count(*) from EQPT_B;
select count(*) from mountdb.sys.EQPT_B;
select to_char(min(time)), to_char(max(time)) from EQPT_B;
select to_char(min(time)), to_char(max(time)) from mountdb.sys.EQPT_B;




-- UMOUNT
umount database mountdb;

-- error for umounted table access
select count(*) from mountdb.sys.EQPT_A;
select count(*) from mountdb.sys.EQPT_B;