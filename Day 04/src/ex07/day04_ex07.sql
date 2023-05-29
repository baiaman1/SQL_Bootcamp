INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT max(id) + 1 FROM person_visits),
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT id FROM pizzeria WHERE name = 'Best Pizza'),
        '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitry_visits_and_eats;

-- SELECT *
-- FROM mv_dmitry_visits_and_eats;