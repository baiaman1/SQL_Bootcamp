WITH menu_table AS (select m.id as menu_id
                    from menu m
                    except
                    select po.menu_id
                    from person_order po
                    order by menu_id)

SELECT pizza_name, price, p.name AS pizzeria_name
FROM menu_table
         LEFT JOIN menu m ON m.id = menu_table.menu_id
         JOIN pizzeria p on m.pizzeria_id = p.id
ORDER BY 1, 2;
