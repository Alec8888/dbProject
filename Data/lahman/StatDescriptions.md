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
