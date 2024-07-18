
drop table mytag2;
CREATE TAG TABLE mytag2 ( name varchar(32) primary key, time datetime basetime, value double summarized,
                          quality integer,  strval varchar(64) );

insert into mytag2 values('vib1', now, 0, 99, 'drilling');
insert into mytag2 (name, time, value) values('vib2', now, 1);
insert into mytag2 values('vib3', now, 3.12, 89, "my vibration string");
insert into mytag2 values('vib1', now, 0, 97, 'drilling2');

select * from mytag2;
select * from _mytag2_meta;

delete from mytag2 where quality = 97;

delete from mytag2 where name = 'vib1';
select * from mytag2;
select * from _mytag2_meta;
delete from mytag2 metadata where name = 'vib1';
select * from _mytag2_meta;
