    -- Continentes & Circuitos --

-- Circuitos Americanos
CREATE VIEW `vw-american_circuits` AS
SELECT
    circ.circuitId,
    circ.circuitRef,
    circ.name,
    circ.location,
    circ.country,
    circ.lat,
    circ.long
FROM
    `circuits` AS circ
WHERE
    circ.country IN ('USA', 'Canada', 'Brazil', 'Mexico', 'Argentina');

-- Circuitos Africanos
CREATE VIEW `vw-african_circuits` AS
SELECT
    circ.circuitId,
    circ.circuitRef,
    circ.name,
    circ.location,
    circ.country,
    circ.lat,
    circ.long
FROM
    `circuits` AS circ
WHERE
    circ.country IN ('South Africa', 'Morocco');

-- Circuitos Asiáticos
CREATE VIEW `vw-asian_circuits` AS
SELECT
    circ.circuitId,
    circ.circuitRef,
    circ.name,
    circ.location,
    circ.country,
    circ.lat,
    circ.long
FROM
    `circuits` AS circ
WHERE
    circ.country IN ('Malaysia', 'Bahrain', 'Turkey', 'Singapore', 'China',
      'UAE', 'Azerbaijan', 'Korea', 'Russia', 'India', 'Japan');

-- Circuitos Europeus
CREATE VIEW `vw-european_circuits` AS
SELECT
    circ.circuitId,
    circ.circuitRef,
    circ.name,
    circ.location,
    circ.country,
    circ.lat,
    circ.long
FROM
    `circuits` AS circ
WHERE
    circ.country IN ('Monaco', 'Hungary', 'Switzerland', 'Netherlands', 'Sweden', 'Italy', 'Belgium', 'Germany',
      'Austria', 'Portugal', 'UK', 'Spain', 'France');

-- Circuitos Oceania
CREATE VIEW `vw-oceania_circuits` AS
SELECT
    circ.circuitId,
    circ.circuitRef,
    circ.name,
    circ.location,
    circ.country,
    circ.lat,
    circ.long
FROM
    `circuits` AS circ
WHERE
    circ.country = 'Australia';

-- Circuitos por Continente
CREATE VIEW `vw-circuits_per_continent` AS
SELECT
    'America' AS `Continent`,
    COUNT(0) AS `Circuit Number`
FROM
    `vw-american_circuits` AS ame_c
UNION
SELECT
    'Europe',
    COUNT(*)
FROM
    `vw-european_circuits` AS euro_c
UNION
SELECT
    'Africa',
    COUNT(*)
FROM
    `vw-african_circuits` AS af_c
UNION
SELECT
    'Asia',
    COUNT(*)
FROM
    `vw-asian_circuits` AS asi_c
UNION
SELECT
    'Oceania',
    COUNT(*)
FROM
    `vw-oceania_circuits` oce_c;

    -- Construtoras & Podiums

-- 1˚ Lugar
CREATE VIEW `vw-1st_con` AS
SELECT
    rslt.constructorId,
    COUNT(rslt.`position`) AS 1_place
FROM
    `results` AS rslt
WHERE
    (rslt.`position` = 1)
GROUP BY
    rslt.constructorId;

-- 2˚ Lugar
CREATE VIEW `vw-2nd_con` AS
SELECT
    rslt.constructorId,
    COUNT(rslt.`position`) AS 2_place
FROM
    `results` AS rslt
WHERE
    (rslt.`position` = 2)
GROUP BY
    rslt.constructorId;

-- 3˚ Lugar
CREATE VIEW `vw-3st_con` AS
SELECT
    rslt.constructorId,
    COUNT(rslt.`position`) AS 3_place
FROM
    `results` AS rslt
WHERE
    (rslt.`position` = 3)
GROUP BY
    rslt.constructorId;

    -- Pilotos & Podiums

-- 1˚ Lugar
CREATE VIEW `vw-1st_drv` AS
SELECT
    rslt.driverId,
    COUNT(rslt.`position`) AS `1_place`
FROM
    `results` AS rslt
WHERE
    (rslt.`position` = 1)
GROUP BY
    rslt.driverId;

-- 2˚ Lugar
CREATE VIEW `vw-2nd_drv` AS
SELECT
    rslt.driverId,
    COUNT(rslt.`position`) AS `2_place`
FROM
    `results` AS rslt
WHERE
    (rslt.`position` = 2)
GROUP BY
    rslt.driverId;

-- 3˚ Lugar
CREATE VIEW `vw-3rd_drv` AS
SELECT
    rslt.driverId,
    COUNT(rslt.`position`) AS `3_place`
FROM
    `results` AS rslt
WHERE
    (rslt.`position` = 3)
GROUP BY
    rslt.driverId;