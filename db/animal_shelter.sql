DROP TABLE IF EXISTS pets;


CREATE TABLE pets (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  picture VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  gender VARCHAR(255),
  date_arrived DATE,
  adoptable BOOLEAN,
  trained BOOLEAN
);
