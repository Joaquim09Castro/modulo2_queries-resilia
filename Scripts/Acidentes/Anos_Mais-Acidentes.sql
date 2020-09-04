SELECT
	CAST(rcs.`year` AS CHAR) Ano,
	COUNT(rslt.raceId) 'Número de acidentes'
FROM 
	`results` rslt
RIGHT JOIN
	`races` rcs
ON
	rcs.raceId = rslt.raceId
WHERE
	rslt.statusId IN (3,4,73,82,104,107)
GROUP BY 
	1
HAVING
    COUNT(rslt.raceId) > 26
ORDER BY
	2 DESC;