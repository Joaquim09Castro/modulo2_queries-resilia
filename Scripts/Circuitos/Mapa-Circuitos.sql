SELECT 
	cir.circuitRef,
	cir.country,
	cir.lat,
	cir.`long`,
	COUNT(rcs.circuitId)
FROM 
	`circuits` cir
LEFT JOIN
	`races` rcs
ON
	cir.circuitId = rcs.circuitId
GROUP BY 
	1,
	2,
	3,
	4
ORDER BY 
	5 DESC;