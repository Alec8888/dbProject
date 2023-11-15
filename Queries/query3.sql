WITH TeamWinPercentages AS (
    SELECT
        year,
        team_id,
        ROUND(SUM(wins) / (SUM(wins) + SUM(losses)) * 100, 3) AS win_percentage
    FROM TeamParticipatesSeason
    GROUP BY year, team_id
),
AverageWinPercentages AS (
    SELECT
        year,
        ROUND(AVG(win_percentage), 3) AS avg_win_percentage
    FROM TeamWinPercentages
    GROUP BY year
)
SELECT DISTINCT
    p.year, 
    ROUND(SUM(CASE WHEN pl.birth_country != 'USA' THEN 1 ELSE 0 END) OVER(PARTITION BY p.team_id, p.year) / 
           COUNT(pl.player_id) OVER(PARTITION BY p.team_id, p.year) * 100, 3) AS foreign_born_team_percentage,
    twp.win_percentage,
    awp.avg_win_percentage
FROM PlaysForATeam p
LEFT JOIN Player pl
    ON p.player_id = pl.player_id 
LEFT JOIN TeamWinPercentages twp
    ON p.team_id = twp.team_id AND p.year = twp.year
LEFT JOIN AverageWinPercentages awp
    ON p.year = awp.year
WHERE p.team_id = :team AND p.year BETWEEN :startYear AND :endYear
ORDER BY p.year
