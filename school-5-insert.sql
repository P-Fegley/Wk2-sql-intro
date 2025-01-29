-- Populate data into columns
INSERT INTO students (
    first_name,
    last_name,
    email
) VALUES (
    "Ben",
    "Block",
    "bj@gmail.com"
);

-- To add second row manually, either run whole line again, or double paren the VALUES
-- i.e. VALUES ( ( [row1 data] ), ( [row2 data] ) );