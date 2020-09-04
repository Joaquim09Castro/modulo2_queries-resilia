SELECT
    win_tbl.`Constructor`,
    (win_tbl.`Win Count` / rcs_tbl.`Race Count`) 'Win Rate'
FROM
    (SELECT
    	c.name 'Constructor',
    	c.constructorId,
        SUM(cs.wins) 'Win Count'
    FROM 
        `constructors` c
    INNER JOIN
        `constructorStandings` cs
    ON 
        c.constructorId = cs.constructorId
    GROUP BY
        1,
        2
    HAVING
        `Win Count` > 0
    ) win_tbl
INNER JOIN
    (SELECT 
        rs.constructorId,
        COUNT(rs.raceId) 'Race Count'
    FROM 
        `results` rs
    GROUP BY 
        1
    ) rcs_tbl
ON
    rcs_tbl.constructorId = win_tbl.constructorId
ORDER BY 
    2 DESC;