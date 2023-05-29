SELECT order_date, (per.name || ' (age:' || per.age || ')') AS person_information
FROM person_order po
NATURAL JOIN (SELECT p.id AS person_id, p.name, p.age FROM person p) AS per
ORDER BY order_date, person_information;