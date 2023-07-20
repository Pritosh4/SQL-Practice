SELECT EXTRACT(YEAR FROM payment_ts)AS year, EXTRACT(MONTH FROM payment_ts) AS month, SUM(amount) AS rev 
FROM payment
GROUP BY year, month;
