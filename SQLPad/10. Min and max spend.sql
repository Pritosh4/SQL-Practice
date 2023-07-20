WITH total AS (SELECT  SUM(amount) AS spend
FROM payment
WHERE EXTRACT(MONTH FROM payment_ts) = 6
GROUP BY customer_id)

SELECT MIN(spend), MAX(spend)
FROM total
