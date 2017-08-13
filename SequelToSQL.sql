

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

