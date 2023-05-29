SELECT m.pizza_name, m.price, p2.name AS pizzeria_name, visit_date
FROM person_visits pv
         JOIN menu m ON m.pizzeria_id = pv.pizzeria_id
         JOIN person p ON pv.person_id = p.id
         JOIN pizzeria p2 ON p2.id = m.pizzeria_id
WHERE m.price BETWEEN 800 AND 1000
  AND p.name = 'Kate'
ORDER BY m.pizza_name, m.price, pizzeria_name;
