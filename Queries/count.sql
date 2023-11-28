SELECT
  (SELECT COUNT(*) FROM battingpostseason) +
  (SELECT COUNT(*) FROM battingseason) +
  (SELECT COUNT(*) FROM fieldingseason) +
  (SELECT COUNT(*) FROM pitchingseason) +
  (SELECT COUNT(*) FROM player) +
  (SELECT COUNT(*) FROM playerhasseason) +
  (SELECT COUNT(*) FROM playsforateam) +
  (SELECT COUNT(*) FROM team) +
  (SELECT COUNT(*) FROM teamparticipatesseason) +
  (SELECT COUNT(*) FROM feedback)
  AS tuple_count
FROM DUAL