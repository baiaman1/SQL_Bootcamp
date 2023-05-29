SELECT pizza_name, piz.name
FROM person_order
         LEFT JOIN menu m on m.id = person_order.menu_id
         LEFT JOIN pizzeria piz on piz.id = m.pizzeria_id
         LEFT JOIN person p on p.id = person_order.person_id
WHERE p.name = 'Denis' OR p.name = 'Anna'
ORDER BY pizza_name, piz.name;