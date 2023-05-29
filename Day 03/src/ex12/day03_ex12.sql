INSERT INTO person_order (id, person_id, menu_id, order_date)
    (SELECT generate_series((SELECT MAX(id) + 1 FROM person_order),
                            (SELECT MAX(id) + COUNT(DISTINCT person_id) FROM person_order)),
            generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person)),
            menu.id,
            '2022-02-25'
     FROM menu
     WHERE pizza_name = 'greek pizza');