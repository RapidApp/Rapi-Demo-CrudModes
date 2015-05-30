
DROP TABLE IF EXISTS [alpha];
CREATE TABLE [alpha] (
  [id]        INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  [string1]   varchar(32) DEFAULT NULL,
  [string2]   varchar(64) DEFAULT NULL,
  [number]    float DEFAULT NULL,
  [bool]      boolean NOT NULL default 0,
  [date]      date DEFAULT NULL
);

