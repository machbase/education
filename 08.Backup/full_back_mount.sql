backup database into disk='/backup/20240630';

mount database '/backup/20240630' to mountdb;

-- EQPT_A 
select to_char(min(time)), to_char(max(time)) from mountdb.sys.EQPT_A;
select count(*) from mountdb.sys.EQPT_A;
select name, to_char(time), value  from mountdb.sys.EQPT_A limit 5;

-- EQPT_B 
select to_char(min(time)), to_char(max(time)) from mountdb.sys.EQPT_B;
select count(*) from mountdb.sys.EQPT_B;
select name, to_char(time), value  from mountdb.sys.EQPT_B limit 5;


-- UMOUNT
umount database mountdb;

-- error for umounted table access
select count(*) from mountdb.sys.EQPT_A;
select count(*) from mountdb.sys.EQPT_B;