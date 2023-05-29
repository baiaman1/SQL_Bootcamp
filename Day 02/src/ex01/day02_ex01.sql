select missing_date::date
from generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
         LEFT JOIN (SELECT *
                    FROM person_visits pv
                    WHERE (pv.person_id = 1 OR pv.person_id = 2)
                      AND visit_date BETWEEN '2022-01-01' AND '2022-01-10') AS pv_temp
                   ON missing_date = pv_temp.visit_date
WHERE pv_temp.visit_date IS NULL
ORDER BY missing_date;