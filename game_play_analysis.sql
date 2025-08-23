SELECT ROUND(
    COUNT(DISTINCT nxt.player_id) / COUNT(DISTINCT f.player_id),
    2
) AS fraction
FROM (
    -- one row per player: their first login date
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) AS f
LEFT JOIN Activity AS nxt
  ON f.player_id = nxt.player_id
 AND nxt.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY);
