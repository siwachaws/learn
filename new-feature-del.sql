select emp_id,count(*)
from employees e
inner join orders o on e.emp_id=o.emp_id
group by emp_id
order by emp_id;
