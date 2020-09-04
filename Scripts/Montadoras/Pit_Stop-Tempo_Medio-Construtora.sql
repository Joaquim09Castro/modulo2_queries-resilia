SELECT
	c.name 'Constructor',
    ROUND(avg(pt.seconds),2) 'Pit Time'
FROM
    `pit_stops` pt
INNER JOIN
    `results` r 
ON
    r.raceId = pt.raceId
INNER JOIN
    `constructors` c
ON 
    c.constructorId = r.constructorId
GROUP BY
    1;