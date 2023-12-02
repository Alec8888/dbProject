WITH teamwinsperyear AS (
    SELECT year, wins
    FROM teamparticipatesseason
    WHERE teamparticipatesseason.team_id = :team AND teamparticipatesseason.year BETWEEN :startYear AND :endYear
),
teamsalariesperyear AS (
    SELECT year, SUM(playsforateam.salary) AS total_spend
    FROM playsforateam
    WHERE playsforateam.team_id = :team AND playsforateam.year BETWEEN :startYear AND :endYear
    GROUP BY year
),
allteamwinsperyear AS (
    SELECT year, SUM(wins) AS total_wins
    FROM teamparticipatesseason
    WHERE teamparticipatesseason.year BETWEEN :startYear AND :endYear
    GROUP BY year
),
allteamsalariesperyear AS (
    SELECT year, SUM(salary) AS total_spend
    FROM playsforateam
    WHERE playsforateam.year BETWEEN :startYear AND :endYear
    GROUP BY year
),
totalteamsperyear AS (
    SELECT year, COUNT(DISTINCT team_id) AS total_teams
    FROM teamparticipatesseason
    WHERE teamparticipatesseason.year BETWEEN :startYear AND :endYear
    GROUP BY year
)
SELECT ts.year AS year,
       ROUND(ts.total_spend / tw.wins, 2) AS team_spend_per_win,
       ROUND(ats.total_spend / atw.total_wins, 2) AS all_spend_per_win,
       tw.wins AS wins,
       ROUND(atw.total_wins / tt.total_teams) AS average_wins_per_team
FROM teamsalariesperyear ts
INNER JOIN teamwinsperyear tw ON ts.year = tw.year
INNER JOIN allteamsalariesperyear ats ON ts.year = ats.year
INNER JOIN allteamwinsperyear atw ON ts.year = atw.year
INNER JOIN totalteamsperyear tt ON ts.year = tt.year
ORDER BY ts.year
