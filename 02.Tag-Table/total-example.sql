---------------------------------- SCHEMA ----------------------------------
drop table basic;
CREATE TAG TABLE basic ( name varchar(32) primary key, time datetime basetime, value double summarized)
    METADATA( factory varchar(32), equipment varchar(64) ) tag_partition_count=1;

---------------------------------- INSERT ----------------------------------
-- insert meta
insert into basic metadata values('tag-1', 'seoul', 'chill');
insert into basic metadata values('tag-2', 'seoul', 'pressure');
insert into basic metadata values('tag-3', 'taegu', 'chill'); -- no data
select * from _basic_meta;

-- insert meta + data
insert into basic values('tag-4', '2022-01-01 11:11:11', 99, 'daegu', 'pressure');
insert into basic (name, time, value) values('tag-1', '2022-01-01 11:11:11', 88);
insert into basic (name, time, value) values('tag-2', '2022-01-01 11:11:11', 77);

select * from _basic_meta;
select * from basic;

---------------------------------- SELECT ----------------------------------
-- select with meta only 
select * from basic where factory = 'seoul';
select * from basic where equipment = 'chill';
select * from basic where equipment = 'pressure';
select * from basic where name = 'tag-1';
select * from basic where factory = 'seoul' and equipment = 'pressure';

-- with meta + time
select * from basic where factory = 'seoul' and equipment = 'chill'  and time between '2022-01-01' and '2022-12-31';

-- with meta + tagname + time
select * from basic where factory = 'seoul' and equipment = 'chill' and name in ('tag-1') and 
              time between '2022-01-01' and '2022-12-31';

---------------------------------- UPDATE ----------------------------------
-- update meta 
update basic metadata set equipment = 'chill2' where name = 'tag-1';

-- error without tagname
update basic metadata set equipment = 'chill2';

select * from _basic_meta;

---------------------------------- DELETE ----------------------------------
-- error in delete meta having data 
delete from basic metadata where name = 'tag-1';
-- delete data
delete from basic where name = 'tag-1';
-- retry delete
delete from basic metadata where name = 'tag-1';

select * from basic;
select * from _basic_meta;


---------------------------------- ADD META COLUMN ----------------------------
alter table _basic_meta add column (alias varchar(128) default 'hate');
select * from basic;
select * from _basic_meta;

update basic metadata set alias = 'love' where name = 'tag-2';
update basic metadata set alias = 'ignore' where name = 'tag-4';

select * from basic where alias = 'love' and 
              time between '2022-01-01' and '2022-12-31';

select * from basic where alias = 'ignore' and 
              time between '2022-01-01' and '2022-12-31';

-- no data
select * from basic where alias = 'hate' and 
              time between '2022-01-01' and '2022-12-31';

---------------------------------- DROP META COLUMN ----------------------------
alter table _basic_meta drop column (alias);


