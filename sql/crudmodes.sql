
DROP TABLE IF EXISTS [alpha];
CREATE TABLE [alpha] (
  [id]          INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [value_1]     varchar(32) DEFAULT NULL,
  [value_2]     varchar(64) DEFAULT NULL,
  [int_3]       integer DEFAULT NULL,
  [decimal_4]   decimal(8,2) DEFAULT NULL,
  [datetime_5]  datetime NOT NULL
);

