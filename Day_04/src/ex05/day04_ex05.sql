CREATE OR REPLACE VIEW v_price_with_discount AS
SELECT p.name,
       m.pizza_name,
       m.price,
       ROUND(m.price * 0.9) AS discount_price
FROM person_order
         JOIN menu m on m.id = person_order.menu_id
         JOIN person p on p.id = person_order.person_id
ORDER BY 1, 2;

-- SELECT *
-- FROM v_price_with_discount;