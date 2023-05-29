WITH max_ages AS (SELECT address, max(age) AS max_age
                  FROM person
                  GROUP BY 1),
     min_ages AS (SELECT address, min(age) AS min_age
                  FROM person
                  GROUP BY 1),
     avg_ages AS (SELECT address, avg(age) AS avg_age
                  FROM person
                  GROUP BY address)

SELECT DISTINCT address,
                round(max_age - min_age / CAST(max_age AS numeric), 2) AS formula,
                round(avg_age, 2)                                      AS average,
                max_age - min_age / CAST(max_age AS numeric) > avg_age AS comparison
FROM person
         NATURAL JOIN max_ages
         NATURAL JOIN min_ages
         NATURAL JOIN avg_ages
ORDER BY 1;     