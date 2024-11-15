CREATE TABLE "html_wiki" (
  html_wiki_id INTEGER PRIMARY KEY AUTOINCREMENT,
  html_wiki_name TEXT NOT NULL,
  html_wiki_description TEXT NOT NULL,
  html_wiki_date_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  html_wiki_date_edit TEXT
);
CREATE TABLE "css_wiki" (
  css_wiki_id INTEGER PRIMARY KEY AUTOINCREMENT,
  css_wiki_name TEXT NOT NULL,
  css_wiki_description TEXT NOT NULL,
  css_wiki_date_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  css_wiki_date_edit TEXT
);
INSERT INTO
  html_wiki (
    html_wiki_name,
    html_wiki_description,
    html_wiki_date_add,
    html_wiki_date_edit
  )
VALUES
('test', 'test', datetime('now'), '');
INSERT INTO
  css_wiki (
    css_wiki_name,
    css_wiki_description,
    css_wiki_date_add,
    css_wiki_date_edit
  )
VALUES
('test', 'test', datetime('now'), '');
drop TABLE css_wiki;
DROP TABLE html_wiki;
SELECT
  *
FROM
  css_wiki;
SELECT
  *
FROM
  html_wiki;
ALTER TABLE
  [python]
ADD
  [python_date_add] TIMESTAMP DEFAULT CURRENT_TIMESTAMP;



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