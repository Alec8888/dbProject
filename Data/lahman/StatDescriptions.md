# Column header descriptions
## Batting.csv
1. **playerID**: Unique identifier for each player.
2. **yearID**: The year for which the statistics are recorded.
3. **stint**: A player might play for more than one team in a given year. Each separate period with a different team is termed a "stint."
4. **teamID**: Identifier for the baseball team.
5. **lgID**: League Identifier (e.g., NL for National League, AL for American League).
6. **G**: Games Played.
7. **AB**: At Bats - the number of times a player comes to bat, excluding walks, hit by pitches, sacrifices, interference, and obstruction.
8. **R**: Runs scored.
9. **H**: Hits - times the batter reached base because of a hit.
10. **2B**: Doubles - hits on which the batter reached second base.
11. **3B**: Triples - hits on which the batter reached third base.
12. **HR**: Home Runs.
13. **RBI**: Runs Batted In - the number of runners who scored due to a batter's actions (except when the batter grounded into a double play or via an error).
14. **SB**: Stolen Bases.
15. **CS**: Caught Stealing - the number of times a player was caught trying to steal a base.
16. **BB**: Bases on Balls (Walks) - the times the batter reached base as a result of a walk.
17. **SO**: Strikeouts.
18. **IBB**: Intentional Bases on Balls (Intentional Walks) - the times the batter was intentionally walked.
19. **HBP**: Hit By Pitch - the times the batter reached base after being struck by a pitch.
20. **SH**: Sacrifice Hits (also known as bunts) - the times the batter was credited with sacrificing a runner with a bunt.
21. **SF**: Sacrifice Flies - the times the batter was credited with sacrificing a runner with a fly ball.
22. **GIDP**: Ground Into Double Play - the times the batter hit into a double play.
## Fielding.csv
1. **playerID**: Unique identifier for each player.
2. **yearID**: The year for which the statistics are recorded.
3. **stint**: A player might play for more than one team in a given year. Each separate period with a different team is termed a "stint."
4. **teamID**: Identifier for the baseball team.
5. **lgID**: League Identifier (e.g., NL for National League, AL for American League).
6. **POS**: Position played. For example, 1B for first base, 2B for second base, SS for shortstop, 3B for third base, OF for outfield, C for catcher, etc.
7. **G**: Games Played at that position.
8. **GS**: Games Started at that position.
9. **InnOuts**: Innings Out, which is the number of outs a player has played in the field. Since there are 3 outs per inning, you'd divide this number by 3 to get the number of innings played.
10. **PO**: Putouts. This is the number of times a fielder records an out, whether by catching a fly ball, tagging a runner, or catching a throw at a base.
11. **A**: Assists. This is the number of times a fielder contributes to an out by throwing the ball to another fielder.
12. **E**: Errors. Mistakes made by a fielder that allows a batter or runner to advance one or more bases or allows an at bat to continue when it should have concluded.
13. **DP**: Double Plays. The number of times a fielder contributes to recording outs on two runners during one play.
14. **PB**: Passed Balls (usually only for catchers). Occurs when a catcher fails to hold onto a pitch that he should have caught, and as a result, a runner advances.
15. **WP**: Wild Pitches (usually only applicable for the pitcher, but sometimes recorded for the catcher). Occurs when a pitch is too hard to handle, not necessarily the catcher's fault, allowing a runner to advance.
16. **SB**: Stolen Bases allowed while this player is on the field (most relevant for catchers and pitchers).
17. **CS**: Runners Caught Stealing by this player (again, most relevant for catchers and pitchers).
18. **ZR**: Zone Rating. An advanced metric that measures a player's defensive ability by considering how many plays they make within their "zone" on the field compared to the league average for that position.
## Pitching
1. **playerID**: Unique identifier for each player.
2. **yearID**: The year for which the statistics are recorded.
3. **stint**: A player might play for more than one team in a given year. Each separate period with a different team is termed a "stint."
4. **teamID**: Identifier for the baseball team.
5. **lgID**: League Identifier (e.g., NL for National League, AL for American League).
6. **W**: Wins. The number of games a pitcher is credited with winning.
7. **L**: Losses. The number of games a pitcher is credited with losing.
8. **G**: Games pitched.
9. **GS**: Games Started as a pitcher.
10. **CG**: Complete Games. The number of games where the pitcher starts and finishes the game without any relief.
11. **SHO**: Shutouts. The number of games where the pitcher allows no runs.
12. **SV**: Saves. The number of games a relief pitcher finishes and is credited with preserving a lead.
13. **IPouts**: Innings Pitched represented as outs. Typically, you'd divide this by 3 to get the total innings pitched.
14. **H**: Hits allowed.
15. **ER**: Earned Runs allowed.
16. **HR**: Home Runs allowed.
17. **BB**: Bases on Balls (Walks) given up.
18. **SO**: Strikeouts by the pitcher.
19. **BAOpp**: Opponents' Batting Average against this pitcher.
20. **ERA**: Earned Run Average. Calculated as (ER × 9) / IP (Innings Pitched).
21. **IBB**: Intentional Bases on Balls given up.
22. **WP**: Wild Pitches.
23. **HBP**: Batters Hit By Pitch.
24. **BK**: Balks. An illegal motion by the pitcher which allows runners to advance a base.
25. **BFP**: Batters Faced by Pitcher.
26. **GF**: Games Finished by the pitcher.
27. **R**: Runs allowed (includes both earned and unearned).
28. **SH**: Sacrifice Hits (bunts) allowed.
29. **SF**: Sacrifice Flies allowed.
30. **GIDP**: Ground Into Double Plays. The number of times a batter hit into a double play against this pitcher.
## People
1. **playerID**: Unique identifier for each player.
2. **birthYear**: Year of birth.
3. **birthMonth**: Month of birth.
4. **birthDay**: Day of birth.
5. **birthCountry**: Country of birth.
6. **birthState**: State of birth (relevant primarily for countries like the U.S.).
7. **birthCity**: City of birth.
8. **deathYear**: Year of death (if applicable).
9. **deathMonth**: Month of death (if applicable).
10. **deathDay**: Day of death (if applicable).
11. **deathCountry**: Country of death (if applicable).
12. **deathState**: State of death (relevant primarily for countries like the U.S. and if applicable).
13. **deathCity**: City of death (if applicable).
14. **nameFirst**: First name.
15. **nameLast**: Last name.
16. **nameGiven**: Full given name (could include middle names and other parts of the name not captured in the first and last name fields).
17. **weight**: Weight in pounds.
18. **height**: Height in inches.
19. **bats**: Batting hand (e.g., "R" for right, "L" for left, "B" for both).
20. **throws**: Throwing hand (e.g., "R" for right, "L" for left).
21. **debut**: Date of the player's major league debut.
22. **finalGame**: Date of the player's final major league game.
23. **retroID**: A unique identifier associated with databases like Retrosheet.
24. **bbrefID**: Player's unique identifier for Baseball-Reference.com.
## Teams
1. **yearID**: The year for which the statistics are recorded.
2. **lgID**: League Identifier (e.g., NL for National League, AL for American League).
3. **teamID**: Identifier for the baseball team.
4. **franchID**: Identifier for the baseball franchise.
5. **divID**: Division Identifier.
6. **Rank**: Team's final rank in their division at the end of the year.
7. **G**: Total Games played.
8. **Ghome**: Games played at home.
9. **W**: Total Wins.
10. **L**: Total Losses.
11. **DivWin**: Division Win flag (Y or N indicating whether the team won the division title).
12. **WCWin**: Wild Card Win flag (Y or N indicating whether the team won the wild card spot).
13. **LgWin**: League Championship flag (Y or N indicating whether the team won the league championship).
14. **WSWin**: World Series Win flag (Y or N indicating whether the team won the World Series).
15. **R**: Runs scored by the team.
16. **AB**: At Bats by the team.
17. **H**: Hits by the team.
18. **2B**: Doubles by the team.
19. **3B**: Triples by the team.
20. **HR**: Home Runs by the team.
21. **BB**: Bases on Balls (Walks) earned by the team.
22. **SO**: Strikeouts by the team.
23. **SB**: Stolen Bases by the team.
24. **CS**: Times Caught Stealing.
25. **HBP**: Batters Hit By Pitch.
26. **SF**: Sacrifice Flies by the team.
27. **RA**: Runs Allowed by the team.
28. **ER**: Earned Runs allowed.
29. **ERA**: Team's Earned Run Average.
30. **CG**: Complete Games by team's pitchers.
31. **SHO**: Shutouts by team's pitchers.
32. **SV**: Saves by team's pitchers.
33. **IPouts**: Innings Pitched represented as outs by team's pitchers.
34. **HA**: Hits Allowed by the team's pitchers.
35. **HRA**: Home Runs Allowed by the team's pitchers.
36. **BBA**: Bases on Balls (Walks) Allowed by the team's pitchers.
37. **SOA**: Strikeouts achieved by the team's pitchers.
38. **E**: Errors made by the team.
39. **DP**: Double Plays made by the team.
40. **FP**: Fielding Percentage of the team.
41. **name**: Team's full name.
42. **park**: Stadium or ballpark where the team played their home games.
43. **attendance**: Total home attendance for the year.
44. **BPF**: Batting Park Factor (measures the effect of the park on a team's batters).
45. **PPF**: Pitching Park Factor (measures the effect of the park on a team's pitchers).
46. **teamIDBR**: Team's identifier for Baseball-Reference.com.
47. **teamIDlahman45**: Team's identifier in the Lahman database.
48. **teamIDretro**: Team's identifier for Retrosheet.
