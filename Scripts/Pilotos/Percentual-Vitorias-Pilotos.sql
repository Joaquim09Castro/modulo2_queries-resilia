SELECT
	drs.driverRef 'Driver',
    ROUND(
        COUNT(rs.position) / (SELECT COUNT(rs.position) FROM `results` rs WHERE rs.position = 1) * 100
    ,2) 'Win Rate'
FROM
	`results` rs
LEFT JOIN 
    `drivers` drs
ON 
    drs.driverId = rs.driverId
WHERE
	rs.position = 1
GROUP BY
	rs.driverId
ORDER BY
	2 DESC;