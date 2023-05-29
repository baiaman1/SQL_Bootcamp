SELECT order_date AS action_date, (SELECT name FROM person WHERE person_id = id) AS person_name
FROM person_order
INTERSECT
SELECT visit_date, (SELECT name FROM person WHERE person_id = id) AS person_name
FROM person_visits
ORDER BY action_date, person_name DESC