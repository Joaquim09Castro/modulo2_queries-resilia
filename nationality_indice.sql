-- quantidade de vitórias por país

SELECT 
	dr.nationality,
    SUM(DS.wins) Wins,
    ROUND(COUNT(wins)/ (SELECT COUNT(*) FROM driverStandings)*100,2) as '%'
FROM driverStandings as DS
INNER JOIN drivers dr ON DS.driverId = dr.driverId 
GROUP BY nationality;

-- Quantidade de pilotos por país
SELECT 
	nationality,
	COUNT(nationality) as Qtd_drivers,
    ROUND(COUNT(nationality) / (SELECT COUNT(*) FROM drivers)* 100, 2) as '%'
FROM drivers
group by nationality;
