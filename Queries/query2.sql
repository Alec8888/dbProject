WITH teamstatsperyear AS (
    SELECT 
        tp.year, 
        tp.wins,
        SUM(pf.salary) AS total_spend
    FROM 
        teamparticipatesseason tp
    LEFT JOIN 
        playsforateam pf ON tp.team_id = pf.team_id AND tp.year = pf.year
    WHERE 
        tp.team_id = :team AND tp.year BETWEEN :startYear AND :endYear
    GROUP BY 
        tp.year, tp.wins
),
allteamsalariesperyear AS (
    SELECT 
        year, 
        SUM(salary) AS total_spend
    FROM 
        playsforateam
    WHERE 
        year BETWEEN :startYear AND :endYear
    GROUP BY 
        year
),
allteamwinsperyear AS (
    SELECT 
        year, 
        SUM(wins) AS total_wins
    FROM 
        teamparticipatesseason
    WHERE 
        year BETWEEN :startYear AND :endYear
    GROUP BY 
        year
),
totalteamsperyear AS (
    SELECT 
        year, 
        COUNT(DISTINCT team_id) AS total_teams
    FROM 
        teamparticipatesseason
    WHERE 
        year BETWEEN :startYear AND :endYear
    GROUP BY 
        year
)
SELECT 
    ts.year AS year,
    ROUND(ts.total_spend / ts.wins, 0) AS team_spend_per_win,
    ROUND(ats.total_spend / atw.total_wins, 0) AS all_spend_per_win,
    ts.wins AS wins,
    ROUND(atw.total_wins / tt.total_teams, 0) AS average_wins_per_team
FROM 
    teamstatsperyear ts
INNER JOIN 
    allteamsalariesperyear ats ON ts.year = ats.year
INNER JOIN 
    allteamwinsperyear atw ON ts.year = atw.year
INNER JOIN 
    totalteamsperyear tt ON ts.year = tt.year
ORDER BY 
    ts.year
