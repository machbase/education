select to_char(min(time)), to_char(max(time)) from EQPT_A;

BACKUP TABLE EQPT_A FROM TO_DATE('2024-04-01 00:00:00','YYYY-MM-DD HH24:MI:SS')
                    TO TO_DATE('2024-05-15 23:59:59','YYYY-MM-DD HH24:MI:SS')
                    INTO DISK = '/backup/EQPTA_20240401_20240515';



mount database '/backup/EQPTA_20240401_20240515' to mountdb;

-- online table A 
select to_char(min(time)), to_char(max(time)) from EQPT_A;
select count(*) from EQPT_A;
SELECT COUNT(*) FROM EQPT_A where TIME BETWEEN TO_DATE('2024-04-01 00:00:00') AND TO_DATE('2024-05-15 23:59:59');

-- mounted table A 
select to_char(min(time)), to_char(max(time)) from mountdb.sys.EQPT_A;
select count(*) from mountdb.sys.EQPT_A;
select name, to_char(time), value  from mountdb.sys.EQPT_A limit 10;




-- UMOUNT
umount database mountdb;

-- error for umounted table access
select count(*) from mountdb.sys.EQPT_A;