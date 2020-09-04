SELECT
    Continent,
    (`Circuit Number` / (SELECT SUM(`Circuit Number`) FROM `vw-circuits_per_continent`))  Percentage
FROM 
    `vw-circuits_per_continent` sq_cpc
ORDER BY 
    2 DESC;