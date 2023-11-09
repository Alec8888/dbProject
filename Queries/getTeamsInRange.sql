SELECT DISTINCT team_id 
FROM playsforateam
WHERE year >= :startYear AND year <= :endYear
ORDER BY team_id