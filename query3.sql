-- most directed movie
SELECT concat(d.first_name,' ',d.last_name) AS fullname, count(m.genre_id)
FROM movies m
JOIN directors d ON d.id = m.director_id
GROUP BY  fullname
ORDER BY count DESC 

-- role > 5
SELECT concat(a.first_name,' ',a.last_name) AS fullname, count(role)
FROM movies_actors ma
JOIN actors a ON a.id = ma.actor_id
GROUP BY fullname
HAVING count(role) > 5

-- most movies created by director
SELECT count(title), concat(d.first_name,' ',d.last_name) AS fullname
FROM movies m
JOIN directors d ON d.id = m.director_id
GROUP BY fullname
ORDER BY count DESC

-- most release movies in 1 year
SELECT count(title), release_date
FROM movies
GROUP BY release_date
ORDER BY count DESC

-- get movie data with actor list
SELECT ma.movie_id , STRING_AGG(a.first_name,', ') AS Actors
FROM movies_actors ma,actors a
GROUP BY ma.movie_id
ORDER BY Actors DESC




select d.first_name, d.last_name, sq.total
FROM(
    SELECT d.id ,COUNT(ma.movie_id)
    FROM movies m
    JOIN directors  m.director_id = d.id
    GROUP BY d.id
) sq
JOIN directors d ON sq.id = d.id