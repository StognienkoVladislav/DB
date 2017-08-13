
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
