-- How many lifetime hits does Barry Bonds have?

-- Expected result:
-- 2935


-- What I tried first. This works, but not how they wanted it.

-- SELECT SUM(hits)
-- FROM stats
-- WHERE player_id = (SELECT id FROM players WHERE first_name = "Barry" AND last_name = "Bonds");


SELECT players.first_name, players.last_name, SUM(stats.hits)
FROM stats 
INNER JOIN players ON players.id = stats.player_id
WHERE players.first_name = "Barry" 
AND players.last_name = "Bonds";
