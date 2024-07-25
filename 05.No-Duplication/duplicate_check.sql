DROP TABLE dup_tag;
CREATE TAG TABLE dup_tag (name varchar(20) primary key, time datetime basetime, value double summarized) TAG_DUPLICATE_CHECK_DURATION=1;


INSERT INTO dup_tag VALUES('tag1', '2024-01-01 09:00:00 000:000:001', 0);
INSERT INTO dup_tag VALUES('tag1', '2024-01-02 09:00:00 000:000:001', 0);    
INSERT INTO dup_tag VALUES('tag1', '2024-01-02 09:00:00 000:000:002', 0);
INSERT INTO dup_tag VALUES('tag1', '2024-01-02 09:00:00 000:000:002', 1); -- Duplicate Data
INSERT INTO dup_tag VALUES('tag1', '2024-01-03 09:00:00 000:000:003', 0);

INSERT INTO dup_tag VALUES('tag2', '2024-01-04 09:00:00 000:000:001', 0);
INSERT INTO dup_tag VALUES('tag2', '2024-01-04 09:00:00 000:000:001', 1); -- Duplicate Data
INSERT INTO dup_tag VALUES('tag2', '2024-01-04 09:00:00 000:000:001', 2); -- Duplicate Data
INSERT INTO dup_tag VALUES('tag2', '2024-01-04 09:00:00 000:000:002', 1);
INSERT INTO dup_tag VALUES('tag2', '2024-01-04 09:00:00 000:000:003', 2);

SELECT * FROM dup_tag where name = 'tag1';

SELECT * FROM dup_tag where name = 'tag2';