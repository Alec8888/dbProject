SELECT DISTINCT team_id 
FROM team
WHERE year >= :startYear AND year <= :endYear
ORDER BY team_id
