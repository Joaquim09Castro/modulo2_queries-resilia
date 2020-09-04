SELECT
    cons.name 'Constructor',
    IFNULL(1st.1_place, 0) '1st Place',
    IFNULL(sq_2nd.`2nd Place`, 0) '2nd Place',
    IFNULL(sq_3rd.`3rd Place`, 0) '3rd Place'
FROM 
    `vw-1st_con` 1st
RIGHT JOIN
    `constructors` cons
ON
    cons.constructorId = 1st.constructorId
RIGHT JOIN
    (SELECT
        cons.constructorId,
        cons.name 'Constructor',
        2nd.2_place '2nd Place'
    FROM 
        `vw-2nd_con` 2nd
    RIGHT JOIN
        `constructors` cons
    ON
        cons.constructorId = 2nd.constructorId
    ) sq_2nd
ON
    sq_2nd.constructorId = cons.constructorId
RIGHT JOIN
    (SELECT
        cons.constructorId,
        cons.name 'Constructor',
        3rd.3_place '3rd Place'
    FROM 
        `vw-3rd_con` 3rd
    RIGHT JOIN
        `constructors` cons
    ON
        cons.constructorId = 3rd.constructorId
    ) sq_3rd
ON
    sq_3rd.constructorId = cons.constructorId
WHERE
    1st.1_place IS NOT NULL OR
    sq_2nd.`2nd Place` IS NOT NULL OR
    sq_3rd.`3rd Place` IS NOT NULL
ORDER BY
    2 DESC,
    3 DESC,
    4 DESC,
    1;