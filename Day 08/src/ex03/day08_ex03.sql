-- session 1
BEGIN TRANSACTION;        -- 1
SELECT *                  
FROM pizzeria
WHERE name = 'Pizza Hut'; -- 3
SELECT *                  
FROM pizzeria
WHERE name = 'Pizza Hut'; -- 6
COMMIT WORK;              -- 7
SELECT *                  
FROM pizzeria
WHERE name = 'Pizza Hut'; -- 8

-- session 2
BEGIN TRANSACTION;        -- 2
UPDATE pizzeria           
SET rating = 3.6
WHERE name = 'Pizza Hut'; -- 4
COMMIT WORK;              -- 5
SELECT *                  
FROM pizzeria
WHERE name = 'Pizza Hut'; -- 9