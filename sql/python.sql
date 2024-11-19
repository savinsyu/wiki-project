CREATE TABLE [python_temp] (
  [python_id] INTEGER PRIMARY KEY AUTOINCREMENT,
  [python_command] TEXT NOT NULL,
  [python_name] TEXT NOT NULL,
  [python_date_add] TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  [python_date_edit] TEXT
);
INSERT INTO
  python_temp
SELECT
  python_id, python_command, python_name, datetime('now'),''
FROM
  python;
DROP TABLE python;
ALTER TABLE
  python_temp RENAME TO python;