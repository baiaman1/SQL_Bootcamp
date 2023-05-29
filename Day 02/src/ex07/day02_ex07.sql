SELECT p2.name AS pizzeria_name
FROM person_visits
JOIN person p on p.id = person_visits.person_id
JOIN pizzeria p2 on person_visits.pizzeria_id = p2.id
JOIN menu m on p2.id = m.pizzeria_id
WHERE p.name = 'Dmitriy' AND visit_date = '2022-01-08' AND price < 800;