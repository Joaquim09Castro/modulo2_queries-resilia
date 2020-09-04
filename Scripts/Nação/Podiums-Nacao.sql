SELECT
    drv.nationality 'Driver',
    SUM(IFNULL(1st.1_place, 0)) '1st Place',
    SUM(IFNULL(sq_2nd.`2nd Place`, 0)) '2nd Place',
    SUM(IFNULL(sq_3rd.`3rd Place`, 0)) '3rd Place'
FROM 
    `vw-1st_drv` 1st
RIGHT JOIN
    `drivers` drv
ON
    drv.driverId = 1st.driverId
RIGHT JOIN
    (SELECT
        drv.driverId,
        drv.nationality 'Driver',
        2nd.2_place '2nd Place'
    FROM 
        `vw-2nd_drv` 2nd
    RIGHT JOIN
        `drivers` drv
    ON
        drv.driverId = 2nd.driverId
    ) sq_2nd
ON
    sq_2nd.driverId = drv.driverId
RIGHT JOIN
    (SELECT
        drv.driverId,
        drv.nationality 'Driver',
        3rd.3_place '3rd Place'
    FROM 
        `vw-3rd_drv` 3rd
    RIGHT JOIN
        `drivers` drv
    ON
        drv.driverId = 3rd.driverId
    ) sq_3rd
ON
    sq_3rd.driverId = drv.driverId
WHERE
    1st.1_place IS NOT NULL OR
    sq_2nd.`2nd Place` IS NOT NULL OR
    sq_3rd.`3rd Place` IS NOT NULL
GROUP BY
    1
ORDER BY
    2 DESC,
    3 DESC,
    4 DESC,
    1;