WITH 
    teamwinsperyear AS (
        SELECT 
            year, 
            wins
        FROM "JOSEPH.BARRON".teamparticipatesseason teamparticipatesseason
        WHERE
            teamparticipatesseason.team_id = 'ATL' AND
            teamparticipatesseason.year BETWEEN 1985 AND 2020
    ),        
    teamsalariesperyear AS (
        SELECT 
            year,
            SUM(playsforateam.salary) AS total_spend
        FROM "JOSEPH.BARRON".playsforateam playsforateam
        WHERE 
            playsforateam.team_id = 'ATL' AND
            playsforateam.year BETWEEN 1985 AND 2020
        GROUP BY year

    )
    SELECT 
        teamsalariesperyear.year AS year,
        ROUND(teamsalariesperyear.total_spend / teamwinsperyear.wins, 2) AS spend_per_win
    FROM teamsalariesperyear
    JOIN teamwinsperyear ON teamwinsperyear.year = teamsalariesperyear.year
    ORDER BY year