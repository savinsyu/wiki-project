CREATE TABLE [links_temp] (
  [links_id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [links_name] TEXT NOT NULL,
  [links_command] TEXT NOT NULL,
  [links_date_add] TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  [links_date_edit] TEXT
);
INSERT INTO
  links_temp
SELECT
  links_id, links_name, links_command, datetime('now'),''
FROM
  links;
DROP TABLE links;
ALTER TABLE
  links_temp RENAME TO links;  
 SELECT
  *
FROM
  links;