# Write your MySQL query statement below

SELECT 
    COALESCE(s2.id, s1.id) AS id,
    s1.student
FROM Seat AS s1
LEFT JOIN Seat AS s2
    ON (s1.id % 2 = 1 AND s2.id = s1.id + 1)
    OR (s1.id % 2 = 0 AND s2.id = s1.id - 1)
ORDER BY id;