SELECT
m.title,
CONCAT(d.first_name,' ',d.last_name) AS fullname
g.name
FROM movies m
LEFT JOIN directors d ON d.id = m.director_id
LEFT JOIN genres g ON g.id = m.genre_id
ORDER BY m.title ASC
LIMIT 50

SELECT 
ma.id,
m.title,m.release_date,m.rating,
CONCAT(a.first_name,' ',a.last_name)
ma.role
FROM movies_actors ma
JOIN movies m ON m.id = ma.movies_id
JOIN actors a ON a.id = ma.actor_id
ORDER BY m.title ASC
