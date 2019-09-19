
DROP TABLE IF EXISTS cattoys; /*lets us run the file multiple times and start fresh
(create table from scratch) each time we run the file*/
DROP TABLE IF EXISTS toys;
DROP TABLE IF EXISTS cats; /*Drop all joins table first b/c they are referencing other tables. Can't dop the other tables 
if something is refrencing them*/ 

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    color VARCHAR(255),
    breed VARCHAR(255) /*NO TRAILING COMMAS!!*/
);

CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    color VARCHAR(255),
    price INTEGER /*NO TRAILING COMMAS!!*/
);

INSERT INTO cats(name, color, breed) /*specifies the order we will be supplying values in below*/
VALUES ('Fred','Yellow','Tabby'), /*,...; <- if you want to add more make sure you separte by commas and end list with semicolon*/
      ('Nick','Green','Aegean'), 
      ('Abby','Blue','Bombay'), 
      ('Lyra','White','Burmese'), 
      ('Mary','White','Cyprus') ;

INSERT INTO toys(name, color, price)
VALUES 
  ('Petsport', 'red', 3),
  ('Leaps', 'orange', 2),
  ('Catit', 'gray', 5),
  ('Kity city', 'black', 24),
  ('Bird feather', 'pink', 5);


CREATE TABLE cattoys(
    id SERIAL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,

    FOREIGN KEY (cat_id) REFERENCES cats(id),
    FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO cattoys(cat_id, toy_id)
VALUES
  (3, 5),
  (2, 1),
  (5, 3),
  (4, 1),
  (1, 4),
  (5, 1);