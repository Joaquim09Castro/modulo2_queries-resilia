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
	(rslt.statusId IN (3,4,73,82,104,107) OR rslt.statusId IS NULL) AND
	rcs.`year` >= 2000
GROUP BY 
	1
ORDER BY
	1 DESC;