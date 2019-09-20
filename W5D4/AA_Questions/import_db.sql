PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255),
  lname VARCHAR(255)
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  author INTEGER,

  FOREIGN KEY (author) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  parent_reply_id INTEGER,
  question_id INTEGER,
  user_id INTEGER,
  body TEXT,

  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,
  likes INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (fname, lname)
VALUES 
  ('Max', 'Phillips'),
  ('Chanakya', 'Valluri'),
  ('Nate', 'Gallagher'),
  ('Dean','Lacap');

INSERT INTO questions (title, body, author)
VALUES 
  ('Cat', 'What''s a cat', 1),
  ('Dog', 'Where''s the dog?', 2),
  ('Lion', 'Why are lions?', 1);

INSERT INTO replies (question_id, user_id, body)
VALUES
  (3, 3, 'Hey whatsup, this is lion'),
  (1, 2, 'I dont know');

INSERT INTO replies (parent_reply_id, question_id, user_id, body)
VALUES   
  (1, 3, 4, 'Thats not what a lion is'),
  (3, 3, 1, 'Because they are awesome!!!'),
  (3, 3, 2, 'Something');

INSERT INTO question_follows (question_id, user_id)
VALUES 
  (1,1),
  (2,2),
  (3,1),
  (1,3),
  (2,4);