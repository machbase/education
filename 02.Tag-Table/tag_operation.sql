
drop table basic;
CREATE TAG TABLE basic ( name varchar(32) primary key, time datetime basetime, value double summarized);
insert into basic values('vib1', '2000-01-01 12:00:00', 0);
insert into basic values('vib1', '2000-01-01 12:30:00', 10);
insert into basic values('vib1', '2000-01-01 13:00:00', 20);
insert into basic values('vib1', '2000-01-01 13:30:00', 30);
insert into basic values('vib1', '2000-01-01 14:00:00', 40);
insert into basic values('vib1', '2000-01-01 14:30:00', 50);
insert into basic values('vib1a', '2000-01-01 15:00:00', 60);


select * from basic;
select * from basic where name = 'vib1' and time between '2000-01-01 00:00:00' and '2000-01-01 13:10:00';
select * from basic where name = 'vib1' and time > '2000-01-01 14:00:00';
