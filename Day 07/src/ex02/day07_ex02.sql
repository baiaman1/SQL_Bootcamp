WITH visits AS (SELECT p.name, count(person_id), 'visit' AS action_type
                FROM person_visits
                         JOIN pizzeria p ON p.id = person_visits.pizzeria_id
                GROUP BY p.name
                ORDER BY action_type, count DESC
                LIMIT 3),
     orders AS (SELECT p2.name, count(person_id), 'order' AS action_type
                FROM person_order
                         JOIN menu m ON m.id = person_order.menu_id
                         JOIN pizzeria p2 ON p2.id = m.pizzeria_id
                GROUP BY p2.name
                ORDER BY action_type, count DESC
                LIMIT 3)

SELECT *
FROM orders
UNION
SELECT *
FROM visits
ORDER BY 3, 2 DESC;

