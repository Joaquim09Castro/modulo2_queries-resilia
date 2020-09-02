
-- Qtd de corridas ganhas
SELECT
	c.name,
    SUM(cs.wins) Qtd_wins
FROM constructors c
INNER JOIN constructorStandings cs ON c.constructorId = cs.constructorId
GROUP BY c.name
ORDER BY Qtd_wins DESC;

-- volta mais rapida
SELECT 
	c.name,
    MIN(fastestLapTime)
FROM results r
INNER JOIN constructors c ON c.constructorId = r.constructorId
GROUP BY c.name;


-- pole positions
SELECT
	c.name,
    SUM(r.grid)
FROM results r
INNER JOIN constructors c ON c.constructorId = r.constructorId
where r.grid = 1
group by c.name;


-- race starts
SELECT 
	c.name,
    COUNT(r.grid)
FROM results r
INNER JOIN constructors c ON c.constructorId = r.constructorId
GROUP BY c.name;


-- race win percentage

-- pit stop average time

SELECT
	r.constructorId,
	c.name,
    ROUND(avg(pt.seconds),2)
FROM pit_stops pt
INNER JOIN results r ON r.raceId = pt.raceId
INNER JOIN constructors c ON c.constructorId = r.constructorId
GROUP BY c.name, r.constructorId

 
