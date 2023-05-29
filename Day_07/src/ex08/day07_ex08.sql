SELECT address, p.name, count(p.name) AS count_of_orders
FROM person
         JOIN person_order po on person.id = po.person_id
         JOIN menu m on m.id = po.menu_id
         JOIN pizzeria p on p.id = m.pizzeria_id
GROUP BY 1, 2
ORDER BY 1, 2;