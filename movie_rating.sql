(
select u.name as results
from users as u
join movierating as mr
on u.user_id = mr.user_id
group by u.user_id
order by count(mr.movie_id) desc, u.name asc
limit 1
)

union all

(
select m.title as results
from movies as m
join movierating as mr
on m.movie_id = mr.movie_id
where mr.created_at between '2020-02-01' and '2020-02-29'
group by m.movie_id
order by avg(mr.rating) desc, m.title asc
limit 1
)