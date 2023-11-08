WITH HR_Percentiles AS (
    SELECT
        year,
        FLOOR(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY HR) ) AS HR_95thPercentile
    FROM battingseason
    WHERE 
        year >= :startYear AND
        year <= :endYear
    GROUP BY year
)
SELECT
    p.year,
    ROUND(
        COUNT(DISTINCT CASE WHEN bps.year IS NOT NULL THEN bs.player_id END) /
        COUNT(DISTINCT bs.player_id) * 100,
        0
    ) AS percentage_in_postseason
FROM HR_Percentiles p
JOIN battingseason bs ON p.year = bs.year
LEFT JOIN battingpostseason bps ON bs.player_id = bps.player_id AND bs.year = bps.year 
GROUP BY p.year
ORDER BY p.year ASC
