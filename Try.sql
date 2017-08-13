
/*Section 1*/
SELECT title
FROM movies;
/*All titles of movies*/


SELECT title, genre
FROM movies;
/*Title + genre*/

SELECT id, title, genre, duration
FROM movies;
/*All table*/

SELECT *
FROM movies;
/*--//--*/

/*Section 2*/

/*WHERE clause*/
SELECT title
FROM movies
WHERE id = 2;

SELECT *
FROM movies
WHERE title = 'The Kid';

SELECT title, duration
FROM movies
WHERE genre = 'Adventure';


/*Section 3*/
/*ORDER BY clause*/
SELECT title
FROM movies
ORDER BY duration;

/*from hight to low*/
SELECT title
FROM movies
ORDER BY duration DESC;

SELECT *
FROM movies
WHERE duration > 100;


SELECT *
FROM movies
WHERE duration < 100;

SELECT *
FROM movies
WHERE duration >= 94;

/*Without*/
SELECT *
FROM movies
WHERE genre <> 'Horror'

/*AND*/
SELECT title
FROM movies
WHERE id = 1
AND genre = 'Comedy';


/*OR*/

SELECT title
FROM movies
WHERE id = 1
OR genre = 'Comedy';


/*Adding Data*/

INSERT INTO movies (id, title, genre, duration)
VALUES (5, 'TheCircus', 'Comedy', 71);


INSERT INTO movies
VALUES (5, 'The Circus', 'Comedy', 71);

INSERT INTO movies (id, title)
VALUES (5, 'The circus');

INSERT INTO movies (title, duration)
VALUES ('The Fly', 80);


/*Changing Current Data*/
UPDATE movies
SET genre = 'Romance', duration = 70
WHERE id = 5;

UPDATE movies
SET genre = 'Romance'
WHERE id = 3 OR id = 5;


/*Removing Data*/
DELETE FROM movies WHERE id = 5;

DELETE FROM movies WHERE duration < 100;


/*Creating and Removing Databases and Tables*/

CREATE DATABASE Chaplin Theaters;

/*Remove DB*/
DROP DATABASE Chaplin Theaters;

CREATE TABLE movies(

    id int,
    title varchar(20),
    genre varchar(100),
    duration int
);

DROP TABLE movies;


/*Manipulating Tables*/
ALTER TABLE movies
ADD COLUMN ratings int;

UPDATE movies
SET ratings = 8
WHERE title = 'Don Juan';

UPDATE movies
SET ratings = 9
WHERE title = 'Peter Pan';

UPDATE movies
SET ratings = 7
WHERE title = 'The Lost World';

UPDATE movies
SEt ratings = 7
WHERE title = 'Robin Hood';

ALTER TABLE movies
DROP COLUMN ratings;

