SELECT
	circ.name 'Circuit Name',
	circ.circuitRef,
	COUNT(rslt.raceId) 'Number of Accidents'
FROM 
	`results` rslt
INNER JOIN
	`races` rcs
ON
	rcs.raceId = rslt.raceId
INNER JOIN 
	`circuits` circ
ON
	circ.circuitId = rcs.circuitId
WHERE
	rslt.statusId IN (3,4,73,82,104,107)
GROUP BY 
	2,
	1
ORDER BY 
	3 DESC,
	1
LIMIT
    15;