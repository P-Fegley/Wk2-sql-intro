-- Who hit the most home runs in 2019, and what team did they play for?

-- Expected result:
--
-- +---------------+------------+-----------+-----------+
-- | New York Mets | Pete       | Alonso    | 53        |
-- +---------------+------------+-----------+-----------+


SELECT teams.name, players.first_name, players.last_name, stats.home_runs
FROM stats
INNER JOIN teams, players
ON stats.team_id = teams.id AND stats.player_id = players.id
WHERE teams.year = 2019
ORDER BY stats.home_runs DESC
LIMIT 1;

