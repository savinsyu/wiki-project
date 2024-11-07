CREATE TABLE IF NOT EXISTS releases (
  release_id INTEGER PRIMARY KEY AUTOINCREMENT,
  release_name TEXT NOT NULL,
  release_number TEXT NOT NULL,
  release_description TEXT NOT NULL,
  release_status TEXT NOT NULL
);