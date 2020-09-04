SELECT 
	nationality,
	COUNT(nationality) as Qtd_drivers,
	ROUND(COUNT(nationality) / (SELECT COUNT(*) FROM drivers)* 100, 2) as '%'
FROM
	drivers
GROUP BY
	1
ORDER BY
    2 DESC;