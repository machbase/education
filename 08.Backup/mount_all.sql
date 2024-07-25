mount database '/backup/20240331' to mountdb1;
mount database '/backup/20240630' to mountdb2;
mount database '/backup/EQPTA_20240401_20240515' to mountdb3;



select count(*) from mountdb1.sys.EQPT_A;
select count(*) from mountdb1.sys.EQPT_B;

select count(*) from mountdb2.sys.EQPT_A;
select count(*) from mountdb2.sys.EQPT_B;

select count(*) from mountdb3.sys.EQPT_A;

-- error : no table
select count(*) from mountdb3.sys.EQPT_B;



