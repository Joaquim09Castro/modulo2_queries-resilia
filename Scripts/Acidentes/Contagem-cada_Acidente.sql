SELECT
	stt.`status`,
	COUNT(rslt.statusId) 'Number of Accidents'
FROM 
	`results` rslt
INNER JOIN
	`status` stt
ON
	stt.statusId = rslt.statusId
WHERE
	rslt.statusId IN (3,4,73,82,104,107)
GROUP BY 
	1
ORDER BY
    2 DESC;