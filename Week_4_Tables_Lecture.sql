-- Create tables with sample data to demonstrate joins
-- I created these tables in a new schema "lecture"
CREATE TABLE chemistry (
    student_id INTEGER,
    grade   INTEGER
);

CREATE TABLE physics (
    student_id INTEGER,
    grade   INTEGER
);

-- Insert data into the tables
INSERT INTO chemistry
VALUES
    (1, 95),
    (2, 90),
    (3, 85);

INSERT INTO physics
VALUES
    (1, 93),
    (2, 91),
    (4, 75);

-- LEFT JOIN
SELECT
	*
FROM chemistry c
LEFT JOIN physics p
    ON c.student_id = p.student_id;

-- RIGHT JOIN
SELECT
	*
FROM chemistry c
RIGHT JOIN physics p
    ON c.student_id = p.student_id;

-- INNER JOIN
SELECT
	*
FROM chemistry c
INNER JOIN physics p
    ON c.student_id = p.student_id;

-- FULL OUTER JOIN
SELECT
	*
FROM chemistry c
FULL OUTER JOIN physics p
    ON c.student_id = p.student_id;

-- FULL OUTER JOIN w/ COALESCE
SELECT
    COALESCE(c.student_id, p.student_id) AS student_id,
    c.grade AS chemistry_grade,
    p.grade AS physics_grade
FROM chemistry c
FULL OUTER JOIN physics p
ON c.student_id = p.student_id;

-- USING
SELECT
	*
FROM chemistry c
FULL OUTER JOIN physics p
USING (student_id);


-- Primary Keys
CREATE TABLE philosophy (
    student_id INTEGER PRIMARY KEY,
    name VARCHAR,
    grade   INTEGER
);

CREATE TABLE history (
    student_id INTEGER PRIMARY KEY,
    name VARCHAR,
    grade   INTEGER
);

-- Add some initial values to each table

INSERT INTO philosophy
VALUES
    (1, 'Jason', 95),
    (2, 'George', 90),
    (3, 'Ashley', 85);

INSERT INTO history
VALUES
    (1, 'Jason', 93),
    (2, 'George', 91),
    (4, 'Jessica', 75);

SELECT
    *
FROM history;

-- Primary key constraint does not allow
-- duplicate values to be inserted
INSERT INTO philosophy
VALUES
    (1, 'Shoko', 80);

-- Let's create a student-level report
SELECT
    COALESCE(p.student_id, h.student_id) AS student_id,
    COALESCE(p.name, h.name) AS name,
    p.grade AS philosophy_grade,
    h.grade AS history_grade
FROM philosophy p
FULL OUTER JOIN history h
ON p.name = h.name;



-- What if another Jason joins the class?
INSERT INTO philosophy
VALUES
    (5, 'Jason', 99);

INSERT INTO history
VALUES
    (5, 'Jason', 99);



-- Let's look at the imdb data

-- How to check if a single column has no NULLs and is unique
-- All 3 of these numbers should match
SELECT
    COUNT(1) AS total_num_rows_in_the_table,
    COUNT(imdb_name_id) AS total_non_null_imdb_name_id,
    COUNT(DISTINCT imdb_name_id) AS total_unique_imdb_name_id
FROM actors;


-- How to check for uniqueness (duplicates) across multiple columns
SELECT
    imdb_title_id,
    imdb_name_id,
    COUNT(1)
FROM title_principals
GROUP BY 1,2
HAVING COUNT(1) > 1;

SELECT COUNT(1) FROM title_principals;










