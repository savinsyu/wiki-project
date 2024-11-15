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


INSERT INTO html_wiki
(html_wiki_name, html_wiki_description, html_wiki_date_add, html_wiki_date_edit)
VALUES('test', 'test', datetime('now'), '');


INSERT INTO css_wiki
(css_wiki_name, css_wiki_description, css_wiki_date_add, css_wiki_date_edit)
VALUES('test', 'test', datetime('now'), '');


drop TABLE css_wiki;
DROP TABLE html_wiki;

SELECT * FROM css_wiki;