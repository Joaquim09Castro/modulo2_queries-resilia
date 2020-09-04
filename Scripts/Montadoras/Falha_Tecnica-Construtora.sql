SELECT
	ctt.name 'Constructors',
	COUNT(stt.status) 'Tecnical Fails'
FROM 
	`status` stt
LEFT JOIN
	`results` rs
ON
	rs.statusId = stt.statusId
INNER JOIN 
	`constructors` ctt
ON
	ctt.constructorId = rs.constructorId 
WHERE
	stt.statusId IN (5,6,7,8,9,10,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,39,40,41,42,43,44,46,
		47,48,49,51,56,61,63,65,66,67,68,69,70,71,72,74,80,83,84,86,87,91,93,94,95,98,99,101,102,103,105,
		106,108,109,110,121,126,129,131,132,135,136)
GROUP BY
	1
ORDER BY 
	2 DESC;