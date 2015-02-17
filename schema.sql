CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  gender TEXT
);

CREATE TABLE responses (
  id INTEGER PRIMARY KEY,
  answer1 TEXT,
  answer2 TEXT,
  answer3 TEXT,
  answer4 TEXT,
  user_id INTEGER references users
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  question TEXT
);

CREATE TABLE options (
  id INTEGER PRIMARY KEY,
  optiona TEXT,
  optionb TEXT,
  optionc TEXT,
  optiond TEXT,
  question_id references questions
);

CREATE TABLE heros (
  id INTEGER PRIMARY KEY,
  name TEXT,
  gender TEXT,
  description TEXT,
  costume TEXT,
  energy_source TEXT
);
