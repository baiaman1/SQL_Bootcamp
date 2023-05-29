SELECT name, count(person_id) AS count_of_visits
FROM person p
         JOIN person_visits pv on p.id = pv.person_id
GROUP BY name
HAVING count(person_id) > 3;
