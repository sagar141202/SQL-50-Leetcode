# Write your MySQL query statement below
SELECT e.employee_id, 
    e.department_id
FROM Employee e
JOIN (
    SELECT employee_id, COUNT(*) AS dept_count
    FROM Employee 
    GROUP BY employee_id
) t
ON e.employee_id = t.employee_id
WHERE t.dept_count = 1 OR e.primary_flag = 'Y';