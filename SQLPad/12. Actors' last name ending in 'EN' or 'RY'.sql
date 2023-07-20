SELECT last_name, COUNT(last_name)
FROM actor
WHERE last_name LIKE '%EN' OR last_name LIKE '%RY'
GROUP BY last_name;
