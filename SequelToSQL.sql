

/*№ of rows*/
SELECT count(*)
FROM Movies;

/*Common Aggregate Functions*/
SELECT count(column_name)
FROM table_name;

SELECT sum(column_name)
FROM table_name;

SELECT avg(column_name)
FROM table_name;

SELECT max(column_name)
FROM table_name;

SELECT min(column_name)
FROM table_name;

SELECT count(title)
FROM Movies;

SELECT sum(cost)
FROM Movies;

SELECT avg(tickets)
FROM Movies;

SELECT max(tickets)
FROM Movies;

SELECT min(tickets)
FROM Movies;

SELECT max(tickets), min(tickets)
FROM Movies;



/*Aggregates Within Clauses*/

SELECT genre, sum(cost)
FROM Movies
GROUP BY genre;


SELECT column_name,  aggregate_function(column_name)
FROM table_name
GROUP BY column_name;


SELECT genre, sum(cost)
FROM Movies
GROUP BY genre
HAVING COUNT(*) > 1;


/*HAVING Recipe*/
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value(optional)
GROUP BY column_name
HAVING aggregate_function(column_name) operator value;



SELECT genre, sum(cost)
FROM Movies
WHERE cost >= 1000000
GROUP BY genre
HAVING COUNT(*) > 1;


/*Identifying Constraints*/
/*Table constraint*/
CREATE TABLE Promotions
(
    id int,
    name varchar(50) NOT NULL UNIQUE,
    category varchar(15) 
    CONSTRAINT unique_name UNIQUE (name, category)
);

INSERT INTO Promotions(id, category)
VALUES (3, 'Merchandise');


/*Column constraint*/
CREATE TABLE Promotions
(
    id int PRIMARY KEY,
    name varchar(50) NOT NULL UNIQUE,
    category varchar(15)
);



/*Value Constraints*/

SELECT id
FROM Movies
WHERE title = 'Gone With the Wind';

SELECT name, category
FROM Promotions
WHERE movie_id = 2;

INSERT INTO Promotions (id, movie_id, name, category)
VALUES (4, 999, 'Fake Promotion', 'Hoax')


CREATE TABLE Movies
(
    id int PRIMARY KEY,
    title varchar(20) NOT NULL UNIQUE
);

CREATE TABLE Promotions
(
    id int PRIMARY KEY,
    movie_id int REFERENCES Movies(id),
    name varchar(50),
    category varchar(15)
);

CREATE TABLE Promotions
(
    id int PRIMARY KEY,
    movie_id int,
    name varchar(50),
    category varchar(15),
    FOREIGN KEY (movie_id) REFERENCES  movies
);


CREATE TABLE Movies
(
    id int PRIMARY KEY,
    title varchar(20) NOT NULL UNIQUE,
    genre varchar(100),
    duration int CHECK (duration > 0)
);


/*Normalization*/

SELECT id
FROM Movies
WHERE title = 'Peter Pan';

SELECT genre_id
FROM Movies_Genres
WHERE movie_id = 2;

SELECT name
FROM Genres
WHERE id = 2 or id = 3;
/*WHERE id IN (2, 3);*/


/*Relationships*/

/*One-to-One
  One-to-Many
  Many-to-Many*/



/*Inner Joins*/  

SELECT review, movie_id
FROM Reviews;

SELECT title
FROM Movies
WHERE id IN (1, 3, 4);

SELECT *
FROM Movies
INNER JOIN Reviews
ON Movies.id = Reviews.movie_id;
/*Same result*/
SELECT *
FROM Reviews
INNER JOIN Movies
ON Reviews.movie_id = Movies.id;


SELECT Movies.title, Reviews.review
FROM Movies
INNER JOIN Reviews
ON Movies.id = Reviews.movie_id;


SELECT Movies.title, Genres.name
FROM Movies
INNER JOIN Movies_Genres
ON Movies.id = Movies_Genres.movie_id
INNER JOIN Genres
ON Movies_Genres.genre_id = Genres.id
WHERE Movies.title = 'Peter Pan';


SELECT Actors.name, Movies.title FROM Actors
INNER JOIN Actors_Movies ON Actors.id = Actors_Movies.actor_id
INNER JOIN Movies ON Actors_Movies.movie_id = Movies.id
ORDER BY Movies.title ASC;


/*Aliases*/
SELECT Movies.title AS films, Reviews.review AS reviews
FROM Movies
INNER JOIN Reviews
ON Movies.id = Reviews.movie_id;


SELECT Movies.title "Weekly Movies",
Reviews.review "Weekly Reviews"
FROM Movies
INNER JOIN Reviews
ON Movies.id = Reviews.movie_id;

SELECT m.title, Reviews.review
FROM Movies m
INNER JOIN Reviews
ON m.id = Reviews.movie_id
ORDER BY m.title;

SELECT m.title, r.review
FROM Movies m
INNER JOIN Reviews r
ON m.id = r.movie_id
ORDER BY m.title;


SELECT m.title, g.name
FROM Movies m
INNER JOIN Movies_Genres mg
ON m.id = mg.movie_id
INNER JOIN Genres g
ON mg.genre_id = g.id
WHERE m.title = 'Peter Pan';


/*Outer Joins*/

SELECT *
FROM Movies
LEFT OUTER JOIN Reviews
ON Movies.id = Reviews.movie_id;


SELECT m.title, r.review
FROM Movies m
LEFT OUTER JOIN Reviews r
ON m.id = r.movie_id
ORDER BY r.id;



SELECT *
FROM Movies
RIGHT OUTER JOIN Reviews
ON Movies.id = Reviews.movie_id;


SELECT m.title, r.review
FROM Movies m
RIGHT OUTER JOIN Reviews r
ON m.id = r.movie_id
ORDER BY r.id;


/*Subqueries*/


SELECT SUM(sales)
FROM Movies
WHERE id IN(
    SELECT movie_id
    FROM Promotions
    WHERE category = 'Non-cash'
);


/*JOIN query*/
SELECT SUM(m.sales)
FROM Movies m
INNER JOIN Promotions p
ON m.id = p.movie_id
WHERE p.category = 'Non cash';


SELECT * FROM Movies WHERE duration >
(SELECT AVG(duration) FROM Movies);

