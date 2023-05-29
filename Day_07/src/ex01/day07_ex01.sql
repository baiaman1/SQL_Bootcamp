SELECT p.name, COUNT(pizzeria_id) AS count_of_visits
FROM person_visits
         JOIN person p on p.id = person_visits.person_id
GROUP BY p.name
ORDER BY 2 DESC, 1
LIMIT 4;