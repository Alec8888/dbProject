SELECT team_id, name
FROM playsforateam NATURAL JOIN team
WHERE year >= :startYear AND year <= :endYear
GROUP BY team_id, name
ORDER BY team_id