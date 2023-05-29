WITH cte_table AS (SELECT missing_date::date
                   FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date)

SELECT cte_table.missing_date
FROM cte_table
         LEFT JOIN (SELECT DISTINCT visit_date
                    FROM person_visits pv
                    WHERE (pv.person_id = 1 OR pv.person_id = 2)
                      AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS pv_temp
                   ON visit_date = cte_table.missing_date
WHERE pv_temp.visit_date IS NULL
ORDER BY missing_date;