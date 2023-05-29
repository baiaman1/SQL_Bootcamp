SELECT p.name,
       count(person_id)     AS count_of_orders,
       round(avg(price), 2) AS average_price,
       max(price)           AS max_price,
       min(price)           AS min_price
FROM person_order
         JOIN menu m ON m.id = person_order.menu_id
         JOIN pizzeria p ON p.id = m.pizzeria_id
GROUP BY p.name
ORDER BY name;