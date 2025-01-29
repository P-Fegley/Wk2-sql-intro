
-- DELETE FROM students;
-- Note: this deletes EVERY row from table (doesn't drop the full table)
-- Note: if you do this and then rerun the 5-insert, it will not reuse the
--       previous IDs. This is important in case something references the
--       old table.

DELETE FROM students
WHERE id = 2;
-- Could use WHERE first_name = "Ben", etc
