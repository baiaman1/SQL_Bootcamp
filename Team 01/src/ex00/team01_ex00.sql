WITH balances AS (SELECT b.user_id, type, sum(b.money) AS volume, currency_id
                  FROM balance b
                           LEFT JOIN "user" u ON u.id = b.user_id
                  GROUP BY b.user_id, type, b.currency_id),
    
     cur AS (SELECT c.id, name, rate_to_usd
             FROM currency c
                      JOIN (SELECT id, max(updated) AS updated
                            FROM currency
                            GROUP BY id) AS t
                           ON c.updated = t.updated AND c.id = t.id),
    
     total_volume AS (SELECT coalesce(u.name, 'not defined')         AS name,
                             coalesce(u.lastname, 'not defined')     AS lastname,
                             balances.type,
                             balances.volume,
                             coalesce(cur.name, 'not defined'),
                             coalesce(cur.rate_to_usd, 1)            AS last_rate_to_usd,
                             (volume * coalesce(cur.rate_to_usd, 1)) AS total_volume_in_usd
--                              balances.user_id
                      FROM balances
                               LEFT JOIN "user" u ON u.id = balances.user_id
                               LEFT JOIN cur ON currency_id = cur.id
                      ORDER BY name DESC, lastname, type)

SELECT *
FROM total_volume;
