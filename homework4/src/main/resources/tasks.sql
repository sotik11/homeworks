-- /1) Select operations:
-- Find the title of each film
SELECT title
FROM homework4.movies;

-- Find the director of each film
SELECT director
FROM homework4.movies;

-- Find the title and director of each film
SELECT title, director
FROM homework4.movies;

-- Find the title and year of each film
SELECT title, year
FROM homework4.movies;

-- Find all the information about each film
SELECT *
FROM homework4.movies;

-- 2) Condition operation:
-- Find the movies released in the years between 2000 and 2010
SELECT *
FROM homework4.movies
WHERE year <= 2010
  AND year >= 2000;

-- Find the movies not released in the years between 2000 and 2010
SELECT *
FROM homework4.movies
WHERE year NOT BETWEEN 2000 AND 2010;

-- Find the movies and their year released in years (2000, 2010, 2020)
SELECT *
FROM homework4.movies
WHERE year IN (2000, 2010, 2020);

-- Find the movies with title starting with either "b", "s", or "p":
SELECT *
FROM homework4.movies
WHERE title LIKE 'S%'
   OR title LIKE 'B%'
   OR title LIKE 'P%';

-- 3) Filtering and sorting:
-- List all directors ordered (alphabetically) without duplicates for movies after 2005
SELECT DISTINCT director
FROM homework4.movies
WHERE year >= 2005
ORDER BY director ASC;

-- 4) JOINs
-- Find title, domestic_sale, international_sales for each movie
SELECT title, boxoffice.domestic_sale, boxoffice.international_sale
FROM homework4.movies
         INNER JOIN homework4.boxoffice ON movies.id = movie_id;

-- Find title, director, rating of each movie where international_sales > domestic_sales
SELECT title, director, rating
FROM homework4.movies
         INNER JOIN homework4.boxoffice ON movies.id = movie_id
WHERE homework4.boxoffice.international_sale > homework4.boxoffice.domestic_sale;

-- List all the movies by their ratings in descending order
SELECT *
FROM homework4.movies
         INNER JOIN homework4.boxoffice ON movies.id = movie_id
ORDER BY rating DESC;

-- List all movies titles and their combined sales
SELECT movies.title,
       SUM(homework4.boxoffice.domestic_sale + homework4.boxoffice.international_sale) AS total_sales
FROM homework4.movies
         INNER JOIN homework4.boxoffice ON movies.id = movie_id
GROUP BY movies.id
ORDER BY movies.id ASC;

-- List all movies that were released on even number years
SELECT *
FROM homework4.movies
WHERE (year % 2) = 0;

-- Find director, the number of movies and average rating each director has directed
SELECT director,
       count(director)                                   AS total_movies,
       SUM(homework4.boxoffice.rating) / count(director) AS average_rating
FROM homework4.movies
         INNER JOIN homework4.boxoffice ON movies.id = movie_id
GROUP BY director
ORDER BY total_movies;

-- Find director, the total domestic and international sales made by each director
SELECT director,
       count(director)                                                                 AS total_movies,
       SUM(homework4.boxoffice.domestic_sale)                                          AS total_domestic_sale,
       SUM(homework4.boxoffice.international_sale)                                     AS total_international_sale,
       SUM(homework4.boxoffice.domestic_sale + homework4.boxoffice.international_sale) AS total_global_sales
FROM homework4.movies
         INNER JOIN homework4.boxoffice ON movies.id = movie_id
GROUP BY director
ORDER BY total_movies;
