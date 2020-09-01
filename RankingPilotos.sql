-- Ranking de pilotos por vitórias --
SELECT
    D.forename  AS primeiro_nome ,
    D.surname AS sobrenome,
    R.raceId,
    COUNT(R.rank)  AS vitorias
FROM
	DRIVERS AS D
INNER JOIN
	RESULTS AS R
ON
	D.driverId = R.driverId
WHERE
	R.rank = 1
GROUP BY
	D.driverId
ORDER BY
	COUNT(R.rank) DESC
LIMIT
	15
;

-- Ranking de pilotos por voltas mais rápidas --
select 
    D.forename  AS primeiro_nome ,
    D.surname AS sobrenome,
    MIN(L.time) as fastestTime
from 
	laptimes AS L
INNER JOIN
	DRIVERS AS D
ON
	L.driverId = D.driverId
group by
	L.driverId
order by
	MIN(time) asc
LIMIT
	15
;

-- Ranking de pilotos por vitorias e voltas mais rápidas --
SELECT
    D.forename  AS primeiro_nome ,
    D.surname AS sobrenome,
    R.raceId,
    COUNT(R.rank) AS vitorias,
    (select 
		MIN(L.time) as fastestTime
		from 
			laptimes AS L
		where
			L.driverId = D.driverId
		group by
			L.driverId
		order by
			MIN(time) asc
		LIMIT
			1
	) AS fastest_time
FROM
	DRIVERS AS D
INNER JOIN RESULTS AS R ON D.driverId = R.driverId
WHERE
	R.rank = 1
GROUP BY
	D.driverId
ORDER BY
	COUNT(R.rank) DESC
LIMIT
	15
;

-- Ranking races starts --
SELECT
	driverId,
    COUNT(raceId)
FROM
	RESULTS
GROUP BY
	driverId
ORDER BY 
	COUNT(raceId) desc
LIMIT
	40;
    



