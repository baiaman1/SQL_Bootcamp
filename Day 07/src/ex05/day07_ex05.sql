SELECT DISTINCT name
FROM person
RIGHT JOIN person_order po on person.id = po.person_id
ORDER BY 1;