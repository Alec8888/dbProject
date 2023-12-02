WITH 
    PERCENTILES AS (
        SELECT 
            PERCENTILE_CONT(0.08) WITHIN GROUP (ORDER BY height ASC) AS "05PERCENTILE",
            PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY height ASC) AS "15PERCENTILE",
            PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY height ASC) AS "50PERCENTILE",
            PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY height ASC) AS "85PERCENTILE",
            PERCENTILE_CONT(0.92) WITHIN GROUP (ORDER BY height ASC) AS "95PERCENTILE"
        FROM 
            player
    ),
    OBPA_within_years AS (
        SELECT 
            ps.player_id,
            ps.year,
            (ps.bfp - ps.sf - ps.sh) / (ps.h + ps.bb + ps.hbp) AS OBP_Against
        FROM PitchingSeason ps
        WHERE 
            year >= :startYear AND
            year <= :endYear AND
            (ps.bfp - ps.sf - ps.sh) / (ps.h + ps.bb + ps.hbp) IS NOT NULL AND
            (ps.h + ps.bb + ps.hbp) > 0
    ),
    OBPA_stats_by_height AS (
        SELECT 
            OBPA_within_years.year,
            p.height,
            OBPA_within_years.OBP_Against,
            CASE 
                WHEN p.height <= PERCENTILES."05PERCENTILE" THEN '-3Deviation'
                WHEN p.height <= PERCENTILES."15PERCENTILE" AND p.height > PERCENTILES."05PERCENTILE" THEN '-2Deviation'
                WHEN p.height <= PERCENTILES."50PERCENTILE" AND p.height > PERCENTILES."15PERCENTILE" THEN '-1Deviation'
                WHEN p.height <= PERCENTILES."85PERCENTILE" AND p.height > PERCENTILES."50PERCENTILE" THEN '+1Deviation'
                WHEN p.height <= PERCENTILES."95PERCENTILE" AND p.height > PERCENTILES."85PERCENTILE" THEN '+2Deviation'
                WHEN p.height > PERCENTILES."95PERCENTILE" THEN '+3Deviation'
            END AS height_group
        FROM player p
        JOIN OBPA_within_years ON OBPA_within_years.player_id = p.player_id,
        PERCENTILES
    )
SELECT 
    year,
    ROUND(AVG(CASE WHEN height_group = '-3Deviation' THEN OBP_Against END) * .1, 3) AS "-3_Deviation_OBP_Against",
    ROUND(AVG(CASE WHEN height_group = '-2Deviation' THEN OBP_Against END)* .1, 3) AS "-2_Deviation_OBP_Against",
    ROUND(AVG(CASE WHEN height_group = '-1Deviation' THEN OBP_Against END)* .1, 3) AS "-1_Deviation_OBP_Against",
    ROUND(AVG(CASE WHEN height_group = '+1Deviation' THEN OBP_Against END)* .1, 3) AS "+1_Deviation_OBP_Against",
    ROUND(AVG(CASE WHEN height_group = '+2Deviation' THEN OBP_Against END)* .1, 3) AS "+2_Deviation_OBP_Against",
    ROUND(AVG(CASE WHEN height_group = '+3Deviation' THEN OBP_Against END)* .1, 3) AS "+3_Deviation_OBP_Against"
FROM OBPA_stats_by_height
GROUP BY year
ORDER BY year