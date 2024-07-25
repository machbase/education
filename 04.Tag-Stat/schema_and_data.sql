drop table tag cascade;
create tag table tag (name varchar(80) primary key, time datetime basetime, value double summarized) tag_partition_count=1;

select count(*) from tag; 