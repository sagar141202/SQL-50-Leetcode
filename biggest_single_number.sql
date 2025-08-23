# Write your MySQL query statement below
SELECT IFNULL(MAX(num), NULL) as num
FROM MyNumbers
WHERE num IN
(
SELECT num 
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1
);