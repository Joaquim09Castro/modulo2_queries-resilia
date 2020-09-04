SELECT
	c.name 'Constructor',
    SUM(r.grid) 'Pole Count'
FROM
    `results` r
INNER JOIN
    constructors c 
ON c.constructorId = r.constructorId
WHERE 
    r.grid = 1
GROUP BY
    1
ORDER BY
    2 DESC;