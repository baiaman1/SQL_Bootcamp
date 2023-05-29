SELECT name
FROM person
         JOIN person_order po on person.id = po.person_id
         JOIN menu m on m.id = po.menu_id
WHERE (address = 'Moscow' OR address = 'Samara')
  AND gender = 'male'
  AND (pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza')
ORDER BY name DESC;