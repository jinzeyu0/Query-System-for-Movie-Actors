
-- Names of all actors in "Die Another Day"
SELECT CONCAT(first, ' ', last)
FROM MovieActor
INNER JOIN Actor ON MovieActor.aid = Actor.id
WHERE mid =
    (SELECT id FROM Movie
     WHERE title = 'Die Another Day');

-- Count of all actors who have acted in multiple movies
SELECT COUNT(DISTINCT ma1.aid)
FROM MovieActor ma1
INNER JOIN MovieActor ma2 ON ma1.aid = ma2.aid AND ma1.mid != ma2.mid;

-- Titles of movies that sell more than 1000000 tickets
SELECT title
FROM Movie
INNER JOIN Sales ON Movie.id = Sales.mid
WHERE ticketsSold > 1000000;

-- Rank each year by average IMDb score of movies in that year, in descending order (of IMDb score)
SELECT year, AVG(imdb) AS IMDb
FROM Movie
INNER JOIN MovieRating ON Movie.id = MovieRating.mid
GROUP BY year
ORDER BY IMDb DESC;

-- Average tickets sold by genre
SELECT genre, AVG(ticketsSold)
FROM MovieGenre
NATURAL JOIN Sales
GROUP BY genre;
