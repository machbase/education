
drop table mytag;
CREATE TAG TABLE MYTAG ( name varchar(32) primary key, time datetime basetime, value double summarized)
                       METADATA( factory varchar(32), equipment varchar(64) );

insert into mytag metadata values ('TAG_0001', 'fact0', 'equip0');
insert into mytag values('vib1', now, 0, 'seoul', 'drilling');
insert into mytag values('vib2', now, 1, 'daegu', 'drilling');
insert into mytag (name, time, value) values('vib3', now, 3);

select * from mytag;

select * from _mytag_meta;

update mytag metadata set factory = 'daegu', equipment = 'bench' where name = 'vib1';

select * from _mytag_meta;

alter table _mytag_meta add column(line varchar(16) default 'op01');

select * from _mytag_meta;

update mytag metadata set line = 'op03' where name = 'vib3';

select * from _mytag_meta;

delete from mytag metadata where name = 'vib1';

delete from mytag where name = 'vib1';
select * from mytag;
select * from _mytag_meta;
delete from mytag metadata where name = 'vib1';
select * from _mytag_meta;
select * from mytag;
select * from _mytag_meta;

