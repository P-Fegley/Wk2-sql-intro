
-- UPDATE students 
-- SET email = "bjblock@hotmail.com"
-- Note: This populates EVERY row of email column

UPDATE students
SET email = "bjblock@hotmail.com"
WHERE id = 1;
-- Could also do WHERE first_name = "Ben" or similar