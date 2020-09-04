-- Número de Acidentes
SELECT
	CAST(rcs.year AS CHAR) Year,
	COUNT(rslt.raceId) Accidents
FROM 
	`results` rslt
RIGHT JOIN
	`races` rcs
ON
	rcs.raceId = rslt.raceId
WHERE
	rslt.statusId IN (3,4,73,82,104,107) OR rslt.statusId IS NULL
GROUP BY 
	1
ORDER BY
	1;

-- Número de Circuitos
SELECT
    CAST(`year` AS CHAR) Year,
    COUNT(raceId) 'GP Count'
FROM
    `races`
GROUP BY
    1
ORDER BY
    1;