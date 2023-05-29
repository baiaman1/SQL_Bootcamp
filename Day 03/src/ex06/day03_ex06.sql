WITH piz1 AS (SELECT p.name, pizza_name, price, p.id
              FROM menu
                       JOIN pizzeria p on menu.pizzeria_id = p.id),
     piz2 AS (SELECT * FROM piz1)

SELECT DISTINCT piz1.pizza_name,
                piz1.name AS pizzeria_name_1,
                piz2.name AS pizzeria_name_2,
                piz1.price
FROM piz2,
     menu m
         JOIN piz1 ON m.pizzeria_id = piz1.id
WHERE piz1.price = piz2.price
  AND piz1.pizza_name = piz2.pizza_name
  AND piz1.name < piz2.name
ORDER BY 1;