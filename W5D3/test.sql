SELECT
  toys.name,
  toys.price,
  toys.color
FROM
  toys
JOIN
  cattoys ON toys.id = cattoys.toy_id
JOIN
  cats ON cats.id = cattoys.cat_id
WHERE
  toys.price < 5 AND cats.name = 'Mary'
;


/* Phase 2 */

-- 1

EXPLAIN SELECT * FROM cats WHERE name = 'Mary';

EXPLAIN ANALYZE
SELECT
  toys.name
FROM
  toys
JOIN
  cattoys ON cattoys.toy_id = toys.id
JOIN
  cats ON cattoys.cat_id = cats.id
WHERE
  cats.name = 'Silver';

EXPLAIN ANALYZE
SELECT
  breed
FROM
  cats
WHERE
  name = 'Noel';



EXPLAIN ANALYZE
SELECT
  toys.name
FROM
  toys
JOIN
  cattoys ON cattoys.toy_id = toys.id
JOIN
  cats ON cattoys.cat_id = cats.id
WHERE
  cats.name = 'Freyja';



  EXPLAIN ANALYZE
  SELECT
    toys.name, cats.name
  FROM
    toys
  JOIN
    cattoys ON cattoys.toy_id = toys.id
  JOIN
    cats ON cats.id = cattoys.cat_id
  WHERE
    cats.color = 'Red' OR toys.color = 'Red';


-- PHASE 3

EXPLAIN ANALYZE
SELECT
  name
FROM
  cats
WHERE
  cats.color = (
    --  Here is a subquery being used as a filter by returning a single result
    SELECT
      cats.color
    FROM
      cats
    WHERE
      name='Freyja'
  );


EXPLAIN ANALYZE
  -- This gives us the same answer as the previous query.
SELECT
  c2.name
  -- This builds a large table with duplicated data so we can filter
FROM
  cats AS c1
JOIN
  cats AS c2 ON (c1.color = c2.color)
WHERE
  c1.name = 'Freyja';



EXPLAIN ANALYZE
-- This query uses a subquery to find the toys name and price for all the cats with the
-- breed 'British Shorthair'.
SELECT
  toys.name, toys.price
FROM
  toys
WHERE
  toys.id IN (SELECT
                toys.id
              FROM
                toys
              JOIN
                cattoys ON toys.id = cattoys.toy_id
              JOIN
                cats ON cats.id = cattoys.cat_id
              WHERE
                cats.breed = 'British Shorthair');



EXPLAIN ANALYZE
-- Creating the larger table is more efficient in this scenario!
SELECT
  toys.name, toys.price
FROM
  cats
JOIN
  cattoys ON cats.id = cattoys.cat_id
JOIN
  toys ON toys.id = cattoys.toy_id
WHERE
  cats.breed = 'British Shorthair';


EXPLAIN
  SELECT DISTINCT cats.name
  FROM cats
  WHERE cats.color = 'Blue' AND cats.id IN (
    SELECT cattoys.cat_id 
    FROM cattoys 
    WHERE
      cattoys.toy_id IN (
        SELECT toys.id 
        FROM toys 
        WHERE toys.color = 'Blue'));