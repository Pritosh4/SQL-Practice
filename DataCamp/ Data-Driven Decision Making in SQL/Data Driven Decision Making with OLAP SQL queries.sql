SELECT gender, -- Extract information of a pivot table of gender and country for the number of customers
	   country,
	   COUNT(*)
FROM customers
GROUP BY CUBE (gender, country)
ORDER BY country;

SELECT genre,
       year_of_release,
       COUNT(*)
FROM movies
GROUP BY CUBE(genre, year_of_release)
ORDER BY year_of_release;

-- Augment the records of movie rentals with information about movies and customers
SELECT *
FROM renting AS r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
LEFT JOIN movies AS m
ON r.movie_id = m.movie_id;

-- Calculate the average rating for each country
SELECT 
	country,
    AVG(rating)
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY country;

SELECT 
	country, 
	genre, 
	AVG(r.rating) AS avg_rating -- Calculate the average rating 
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY CUBE(country, genre); -- For all aggregation levels of country and genre

SELECT 
	nationality, -- Select nationality of the actors
    gender, -- Select gender of the actors
    COUNT(*) -- Count the number of actors
FROM actors
GROUP BY GROUPING SETS ((gender), (nationality), ()); -- Use the correct GROUPING SETS operation

SELECT 
	country, -- Select country, gender and rating
    gender,
    rating
FROM renting AS r
LEFT JOIN customers AS c -- Use the correct join
ON r.customer_id = c.customer_id;

SELECT 
	c.country, 
    c.gender,
	AVG(r.rating) -- Calculate average rating
FROM renting AS r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY c.country, c.gender -- Order and group by country and gender
ORDER BY c.country, c.gender;

SELECT 
	c.country, 
    c.gender,
	AVG(r.rating)
FROM renting AS r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY GROUPING SETS (c.country), (c.gender); -- Group by country and gender with GROUPING SETS

SELECT 
	c.country, 
    c.gender,
	AVG(r.rating)
FROM renting AS r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
-- Report all info from a Pivot table for country and gender
GROUP BY GROUPING SETS ((country, gender), (country), (gender), ());















