SELECT title,relase_date 
FROM movies
WHERE release_date = 2020-01-01 00:00:00
ORDER BY title ASC
LIMIT 20


SELECT first_name
FROM actors
WHERE first_name LIKE '%s'
ORDER BY ASC
LIMIT 20


SELECT rating, title, relase_date
FROM movies
WHERE rating BETWEEN 4.0 AND 8.0
AND relase_date BETWEEN 2004-01-01 00:00:00 AND 2010-12-30 24:00:00
ORDER BY title ASC
LIMIT 20
