-- Query 5
WITH HR_Percentiles AS ( -- Top 5% cutoff
    SELECT
        year,
        FLOOR(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY HR) ) AS HR_95thPercentile
    FROM "JOSEPH.BARRON".battingseason
    WHERE 
        year >= 1900 AND
        year <= 2023
    GROUP BY year
)
SELECT
    p.year,
    --COUNT(DISTINCT CASE WHEN bps.year IS NOT NULL THEN bs.player_id END) AS players_in_postseason,
    --COUNT(DISTINCT bs.player_id) AS total_players_in_95th_percentile,
    ROUND(
        COUNT(DISTINCT CASE WHEN bps.year IS NOT NULL THEN bs.player_id END) /
        COUNT(DISTINCT bs.player_id) * 100,
        0
    ) AS percentage_in_postseason
FROM HR_Percentiles p
JOIN "JOSEPH.BARRON".battingseason bs ON p.year = bs.year
LEFT JOIN "JOSEPH.BARRON".battingpostseason bps ON bs.player_id = bps.player_id AND bs.year = bps.year 
GROUP BY p.year
ORDER BY p.year;