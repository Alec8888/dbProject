SELECT DISTINCT
    PlaysForATeam.year, 
    ROUND(SUM(CASE WHEN Player.birth_country != 'USA' THEN 1 ELSE 0 END) OVER(PARTITION BY PlaysForATeam.team_id, PlaysForATeam.year) / 
           (SUM(CASE WHEN Player.birth_country != 'USA' THEN 1 ELSE 0 END) OVER(PARTITION BY PlaysForATeam.team_id, PlaysForATeam.year) 
          + SUM(CASE WHEN Player.birth_country = 'USA' THEN 1 ELSE 0 END) OVER(PARTITION BY PlaysForATeam.team_id, PlaysForATeam.year)) * 100, 2) foreign_born_team_percentage,
    ROUND(TeamParticipatesSeason.wins / (TeamParticipatesSeason.wins + TeamParticipatesSeason.losses) * 100, 2) win_percentage
FROM PlaysForATeam
LEFT JOIN Player
    ON PlaysForATeam.player_id = Player.player_id 
LEFT JOIN TeamParticipatesSeason
    ON PlaysForATeam.team_id = TeamParticipatesSeason.team_id AND PlaysForATeam.year = TeamParticipatesSeason.year
WHERE PlaysForATeam.team_id = :team AND PlaysForATeam.year BETWEEN :startYear AND :endYear
ORDER BY PlaysForATeam.year
