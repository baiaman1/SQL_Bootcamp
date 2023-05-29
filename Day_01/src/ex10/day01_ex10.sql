SELECT p.name AS person_name, pizza_name, piz.name AS pizzeria_name
FROM person_order po
         JOIN person p ON p.id = po.person_id
         JOIN menu m on m.id = po.menu_id
         JOIN pizzeria piz on piz.id = m.pizzeria_id
ORDER BY person_name, pizza_name, pizzeria_name;