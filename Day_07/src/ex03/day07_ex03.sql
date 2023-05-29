WITH visits AS (SELECT p.name, count(person_id), 'visit' AS action_type
                FROM person_visits
                         JOIN pizzeria p ON p.id = person_visits.pizzeria_id
                GROUP BY p.name),
     orders AS (SELECT p2.name, count(person_id), 'order' AS action_type
                FROM person_order
                         JOIN menu m ON m.id = person_order.menu_id
                         JOIN pizzeria p2 ON p2.id = m.pizzeria_id
                GROUP BY p2.name),
     statistic AS (SELECT o.name, (o.count + v.count) AS total_count
                   FROM orders o
                            JOIN visits v ON v.name = o.name)

SELECT pizzeria.name,
       CASE
           WHEN total_count IS NULL THEN 0
           ELSE total_count
           END
FROM pizzeria
         FULL JOIN statistic ON pizzeria.name = statistic.name
ORDER BY total_count DESC, name;
