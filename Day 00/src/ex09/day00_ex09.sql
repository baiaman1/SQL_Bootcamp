select (select p.name from person p where p.id = pv.person_id) as person_name,
	   (select piz.name from pizzeria piz where piz.id = pv.pizzeria_id) as pizzeria_name
from (select * from person_visits where visit_date between '2022-01-07' and '2022-01-09') as pv
order by person_name asc, pizzeria_name desc