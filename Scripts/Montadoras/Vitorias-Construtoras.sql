SELECT
	c.name 'Constructor',
    SUM(cs.wins) 'Win Count'
FROM 
    `constructors` c
INNER JOIN
    `constructorStandings` cs
ON 
    c.constructorId = cs.constructorId
GROUP BY
    1
HAVING
    `Win Count` > 0
UNION
SELECT
    'Others',
    0
ORDER BY
    2 DESC;