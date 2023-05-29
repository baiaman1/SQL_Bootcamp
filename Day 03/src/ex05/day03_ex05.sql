SELECT piz.name AS pizzeria_name
FROM person_visits
         JOIN person p on p.id = person_visits.person_id
         JOIN pizzeria piz on piz.id = person_visits.pizzeria_id
WHERE p.name = 'Andrey'
  AND piz.name NOT IN (SELECT p2.name
                       FROM person_order
                                JOIN person p on p.id = person_order.person_id
                                JOIN menu m on m.id = person_order.menu_id
                                JOIN pizzeria p2 on p2.id = m.pizzeria_id
                       WHERE p.name = 'Andrey')
ORDER BY 1;