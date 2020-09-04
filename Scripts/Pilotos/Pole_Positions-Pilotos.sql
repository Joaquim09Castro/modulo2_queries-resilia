SELECT
	drv.driverRef 'Driver',
    COUNT(rs.grid) 'Pole Count'
FROM 
	`results` rs
LEFT JOIN
    `drivers` drv
ON
    drv.driverId = rs.driverId
WHERE
	rs.grid = 1
GROUP BY
	1
ORDER BY
	2 DESC;