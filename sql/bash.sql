CREATE TABLE [bash_temp] (
  [bash_id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [bash_command] TEXT NOT NULL,
  [bash_name] TEXT NOT NULL,
  [bash_date_add] TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  [bash_date_edit] TEXT
);
INSERT INTO
  bash_temp
SELECT
  bash_id, bash_command, bash_name, datetime('now'),''
FROM
  bash;
DROP TABLE bash;
ALTER TABLE
  bash_temp RENAME TO bash;