WITH 
    PERCENTILES AS (
        SELECT 
            PERCENTILE_CONT(0.05) WITHIN GROUP (ORDER BY height ASC) AS "05PERCENTILE",
            PERCENTILE_CONT(0.15) WITHIN GROUP (ORDER BY height ASC) AS "15PERCENTILE",
            PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY height ASC) AS "50PERCENTILE",
            PERCENTILE_CONT(0.85) WITHIN GROUP (ORDER BY height ASC) AS "85PERCENTILE",
            PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY height ASC) AS "95PERCENTILE"
        FROM 
            "JOSEPH.BARRON".player
    ),
    OBP_within_years AS (
        SELECT 
            bs.player_id,
            bs.year,
            (bs.h + bs.hbp + bs.bb) / (bs.ab + bs.hbp + bs.bb + bs.sf) AS OBP
        FROM "JOSEPH.BARRON".BattingSeason bs
        WHERE 
            year >= :startYear AND
            year <= :endYear AND
            (bs.h + bs.ab + bs.hbp + bs.bb + bs.sf) IS NOT NULL AND
            (bs.ab + bs.hbp + bs.bb + bs.sf) > 0
    ),
    OBP_stats_by_height AS (
        SELECT 
            OBP_within_years.year,
            p.height,
            OBP_within_years.OBP,
            CASE 
                WHEN p.height <= PERCENTILES."05PERCENTILE" THEN '-3Deviation'
                WHEN p.height <= PERCENTILES."15PERCENTILE" AND p.height > PERCENTILES."05PERCENTILE" THEN '-2Deviation'
                WHEN p.height <= PERCENTILES."50PERCENTILE" AND p.height > PERCENTILES."15PERCENTILE" THEN '-1Deviation'
                WHEN p.height <= PERCENTILES."85PERCENTILE" AND p.height > PERCENTILES."50PERCENTILE" THEN '+1Deviation'
                WHEN p.height <= PERCENTILES."95PERCENTILE" AND p.height > PERCENTILES."85PERCENTILE" THEN '+2Deviation'
                WHEN p.height > PERCENTILES."95PERCENTILE" THEN '+3Deviation'
            END AS height_group
        FROM "JOSEPH.BARRON".player p
        JOIN OBP_within_years ON OBP_within_years.player_id = p.player_id,
        PERCENTILES
    )
SELECT 
    year,
    ROUND(AVG(CASE WHEN height_group = '-3Deviation' THEN OBP END), 2) AS "-3_Deviation_OBP",
    ROUND(AVG(CASE WHEN height_group = '-2Deviation' THEN OBP END), 2) AS "-2_Deviation_OBP",
    ROUND(AVG(CASE WHEN height_group = '-1Deviation' THEN OBP END), 2) AS "-1_Deviation_OBP",
    ROUND(AVG(CASE WHEN height_group = '+1Deviation' THEN OBP END), 2) AS "+1_Deviation_OBP",
    ROUND(AVG(CASE WHEN height_group = '+2Deviation' THEN OBP END), 2) AS "+2_Deviation_OBP",
    ROUND(AVG(CASE WHEN height_group = '+3Deviation' THEN OBP END), 2) AS "+3_Deviation_OBP"
FROM OBP_stats_by_height
GROUP BY year
ORDER BY year