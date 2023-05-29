SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT menu.pizza_name, p.name AS pizzeria_name
FROM menu
         JOIN pizzeria p on menu.pizzeria_id = p.id;