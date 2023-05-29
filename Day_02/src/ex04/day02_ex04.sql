SELECT pizza_name, p.name AS pizzeria_name, price
FROM menu
         JOIN pizzeria p on menu.pizzeria_id = p.id
WHERE pizza_name = 'pepperoni pizza'
   OR pizza_name = 'mushroom pizza'
ORDER BY pizza_name, name;