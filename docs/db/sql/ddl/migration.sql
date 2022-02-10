CREATE TABLE IF NOT EXISTS "migration" (
"id" serial,
"type" varchar(25) NOT NULL,
"name" varchar(50) NOT NULL,
"migration" varchar(100) DEFAULT '' NOT NULL
)
--DEFAULT CHARACTER SET utf8
;

