SELECT
	crc.circuitRef,
	COUNT(rcs.circuitId) 
FROM
	`races` rcs
RIGHT JOIN
	`circuits` crc
ON
	rcs.circuitId = crc.circuitId
GROUP BY
	1
ORDER BY 
	2 DESC,
	1
LIMIT
    17;