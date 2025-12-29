CREATE TABLE
  [wiki] (
    [wiki_name] TEXT NOT NULL,
    [wiki_content] TEXT NOT NULL,
    [wiki_date_add] TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    [wiki_date_edit] TEXT NULL,
    [wiki_id] INTEGER PRIMARY KEY NOT NULL
  );
