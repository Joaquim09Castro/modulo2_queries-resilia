SELECT
	drv.driverRef,
    COUNT(rs.raceId) 'Races'
FROM
	`results` rs
LEFT JOIN
    `drivers` drv
ON
    rs.driverId = drv.driverId
GROUP BY
	1
ORDER BY 
	2 DESC
LIMIT
    100;