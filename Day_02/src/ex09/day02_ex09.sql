WITH female AS (SELECT name, pizza_name
                FROM person
                         JOIN person_order po on person.id = po.person_id
                         JOIN menu m on m.id = po.menu_id
                WHERE gender = 'female')

SELECT female.name AS name
FROM female
WHERE pizza_name = 'pepperoni pizza'
INTERSECT
SELECT female.name AS name
FROM female
WHERE pizza_name = 'cheese pizza'
ORDER BY name;