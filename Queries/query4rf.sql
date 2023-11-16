WITH 
    PERCENTILES AS (
        SELECT 
            PERCENTILE_CONT(0.05) WITHIN GROUP (ORDER BY height ASC) AS "05PERCENTILE",
            PERCENTILE_CONT(0.15) WITHIN GROUP (ORDER BY height ASC) AS "15PERCENTILE",
            PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY height ASC) AS "50PERCENTILE",
            PERCENTILE_CONT(0.85) WITHIN GROUP (ORDER BY height ASC) AS "85PERCENTILE",
            PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY height ASC) AS "95PERCENTILE"
        FROM 
            player
    ),
    FRF_within_years AS (
        SELECT 
            fs.player_id,
            fs.year,
            (fs.po + fs.a) / fs.g AS FRF
        FROM FieldingSeason fs
        WHERE 
            year >= :startYear AND
            year <= :endYear AND
            (fs.po + fs.a) IS NOT NULL AND
            fs.g > 0
    ),
    FRF_stats_by_height AS (
        SELECT 
            FRF_within_years.year,
            p.height,
            FRF_within_years.FRF,
            CASE 
                WHEN p.height <= PERCENTILES."05PERCENTILE" THEN '-3Deviation'
                WHEN p.height <= PERCENTILES."15PERCENTILE" AND p.height > PERCENTILES."05PERCENTILE" THEN '-2Deviation'
                WHEN p.height <= PERCENTILES."50PERCENTILE" AND p.height > PERCENTILES."15PERCENTILE" THEN '-1Deviation'
                WHEN p.height <= PERCENTILES."85PERCENTILE" AND p.height > PERCENTILES."50PERCENTILE" THEN '+1Deviation'
                WHEN p.height <= PERCENTILES."95PERCENTILE" AND p.height > PERCENTILES."85PERCENTILE" THEN '+2Deviation'
                WHEN p.height > PERCENTILES."95PERCENTILE" THEN '+3Deviation'
            END AS height_group
        FROM player p
        JOIN FRF_within_years ON FRF_within_years.player_id = p.player_id,
        PERCENTILES
    )
SELECT 
    year,
    ROUND(AVG(CASE WHEN height_group = '-3Deviation' THEN FRF END), 2) AS "-3_Deviation_RF",
    ROUND(AVG(CASE WHEN height_group = '-2Deviation' THEN FRF END), 2) AS "-2_Deviation_RF",
    ROUND(AVG(CASE WHEN height_group = '-1Deviation' THEN FRF END), 2) AS "-1_Deviation_RF",
    ROUND(AVG(CASE WHEN height_group = '+1Deviation' THEN FRF END), 2) AS "+1_Deviation_RF",
    ROUND(AVG(CASE WHEN height_group = '+2Deviation' THEN FRF END), 2) AS "+2_Deviation_RF",
    ROUND(AVG(CASE WHEN height_group = '+3Deviation' THEN FRF END), 2) AS "+3_Deviation_RF"
FROM FRF_stats_by_height
GROUP BY year
ORDER BY year