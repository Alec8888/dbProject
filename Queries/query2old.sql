WITH teamwinsperyear AS (
    SELECT year, wins
    FROM teamparticipatesseason
    WHERE teamparticipatesseason.team_id = :team AND teamparticipatesseason.year BETWEEN :startYear AND :endYear
), teamsalariesperyear AS (
    SELECT year, SUM(playsforateam.salary) AS total_spend
    FROM playsforateam
    WHERE playsforateam.team_id = :team AND playsforateam.year BETWEEN :startYear AND :endYear
    GROUP BY year
)
SELECT teamsalariesperyear.year AS year, ROUND(teamsalariesperyear.total_spend / teamwinsperyear.wins, 2) AS spend_per_win
FROM teamsalariesperyear
JOIN teamwinsperyear ON teamwinsperyear.year = teamsalariesperyear.year
ORDER BY year
