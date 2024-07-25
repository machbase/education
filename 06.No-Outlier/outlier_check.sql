DROP TABLE out_tag;

CREATE TAG TABLE out_tag (
    tag_id  VARCHAR(50) PRIMARY KEY,
    time    DATETIME    BASETIME,
    value   DOUBLE     SUMMARIZED) 
METADATA (
    lsl     DOUBLE LOWER LIMIT,
    usl     DOUBLE UPPER LIMIT 
) TAG_PARTITION_COUNT=1;



DROP TABLE out_tag;

CREATE TAG TABLE out_tag (
    tag_id  VARCHAR(50) PRIMARY KEY,
    time    DATETIME    BASETIME,
    value   DOUBLE     SUMMARIZED) 
METADATA (
    lsl    DOUBLE LOWER LIMIT  
) TAG_PARTITION_COUNT=1;



DROP TABLE out_tag;

CREATE TAG TABLE out_tag (
    tag_id  VARCHAR(50) PRIMARY KEY,
    time    DATETIME    BASETIME,
    value   DOUBLE     SUMMARIZED
) TAG_PARTITION_COUNT=1;

ALTER TABLE _out_tag_meta ADD COLUMN (lsl DOUBLE LOWER LIMIT);
ALTER TABLE _out_tag_meta ADD COLUMN (usl DOUBLE UPPER LIMIT);



DROP TABLE out_tag;

CREATE TAG TABLE out_tag (
    tag_id  VARCHAR(50) PRIMARY KEY,
    time    DATETIME    BASETIME,
    value   DOUBLE     SUMMARIZED
) TAG_PARTITION_COUNT=1;

ALTER TABLE _out_tag_meta ADD COLUMN (lsl DOUBLE LOWER LIMIT);



INSERT INTO out_tag metadata VALUES ('TAG_01', 100.0, 200.0); -- 1st error. only lsl(lower) column.

ALTER TABLE _out_tag_meta ADD COLUMN (usl DOUBLE UPPER LIMIT); -- add usl(upper) column.


INSERT INTO out_tag VALUES ('TAG_01', NOW, 95.2);  --Failure [ERR-02342: SUMMARIZED value is less than LOWER LIMIT.]

INSERT INTO out_tag VALUES ('TAG_01', NOW, 100.0); --Success (Inclusive)

INSERT INTO out_tag VALUES ('TAG_01', NOW, 150.5); --Success

INSERT INTO out_tag VALUES ('TAG_01', NOW, 200.0); --Success (Inclusive)

INSERT INTO out_tag VALUES ('TAG_01', NOW, 205.5); --Failure [ERR-02341: SUMMARIZED value is greater than UPPER LIMIT.]


SELECT * FROM out_tag;



UPDATE out_tag metadata SET lsl = 10, usl = 100 WHERE tag_id = 'TAG_01';

SELECT * FROM _out_tag_meta;



UPDATE out_tag metadata SET lsl = NULL, usl = NULL WHERE tag_id = 'TAG_01';

SELECT * FROM _out_tag_meta;
