-- Who was the leading home run hitter for each team in 2019?
-- NOTE: need more advanced SQL to answer this question without
--       raising a warning: "Field of aggregated query neither grouped nor aggregated"

-- Expected result:
--
-- +-------------------------------+------------+-------------+----------------------+
-- | Arizona Diamondbacks          | Eduardo    | Escobar     | 35                   |
-- | Atlanta Braves                | Ronald     | Acuna       | 41                   |
-- | Baltimore Orioles             | Trey       | Mancini     | 35                   |
-- | Boston Red Sox                | J. D.      | Martinez    | 36                   |
-- | Chicago Cubs                  | Kyle       | Schwarber   | 38                   |
-- | Chicago White Sox             | Jose       | Abreu       | 33                   |
-- | Cincinnati Reds               | Eugenio    | Suarez      | 49                   |
-- | Cleveland Indians             | Carlos     | Santana     | 34                   |
-- | Colorado Rockies              | Nolan      | Arenado     | 41                   |
-- | Detroit Tigers                | Brandon    | Dixon       | 15                   |
-- | Houston Astros                | Alex       | Bregman     | 41                   |
-- | Kansas City Royals            | Jorge      | Soler       | 48                   |
-- | Los Angeles Angels of Anaheim | Mike       | Trout       | 45                   |
-- | Los Angeles Dodgers           | Cody       | Bellinger   | 47                   |
-- | Miami Marlins                 | Starlin    | Castro      | 22                   |
-- | Milwaukee Brewers             | Christian  | Yelich      | 44                   |
-- | Minnesota Twins               | Nelson     | Cruz        | 41                   |
-- | New York Mets                 | Pete       | Alonso      | 53                   |
-- | New York Yankees              | Gleyber    | Torres      | 38                   |
-- | Oakland Athletics             | Matt       | Chapman     | 36                   |
-- | Philadelphia Phillies         | Bryce      | Harper      | 35                   |
-- | Pittsburgh Pirates            | Josh       | Bell        | 37                   |
-- | San Diego Padres              | Hunter     | Renfroe     | 33                   |
-- | San Francisco Giants          | Kevin      | Pillar      | 21                   |
-- | Seattle Mariners              | Dan        | Vogelbach   | 30                   |
-- | St. Louis Cardinals           | Paul       | Goldschmidt | 34                   |
-- | Tampa Bay Rays                | Austin     | Meadows     | 33                   |
-- | Texas Rangers                 | Rougned    | Odor        | 30                   |
-- | Toronto Blue Jays             | Randal     | Grichuk     | 31                   |
-- | Washington Nationals          | Anthony    | Rendon      | 34                   |
-- +-------------------------------+------------+-------------+----------------------+


-- Actual answer, advanced method.
-- Nested FROM function gives table with all team IDs for 2019 and their max number of HRs
-- Then the [INNER JOIN stats ... AND] line pulls all players from that team with that max number of HRs.
SELECT teams.name, players.first_name, players.last_name, stats.home_runs
FROM (
  SELECT stats.team_id AS team_id, MAX(stats.home_runs) AS home_runs
  FROM stats 
  INNER JOIN teams ON teams.id = stats.team_id
  WHERE teams.year = 2019
  GROUP BY stats.team_id
) AS max_run_stats
INNER JOIN stats ON stats.team_id = max_run_stats.team_id
AND stats.home_runs = max_run_stats.home_runs
INNER JOIN teams ON stats.team_id = teams.id
INNER JOIN players ON players.id = stats.player_id;
ORDER BY teams.name;


-- My way. Doesn't account for teams with tied home run leaders
SELECT teams.name, players.first_name, players.last_name, MAX(stats.home_runs) AS home_runs
FROM stats
INNER JOIN teams, players
ON stats.team_id = teams.id AND stats.player_id = players.id
WHERE teams.year = 2019
GROUP BY teams.name;

