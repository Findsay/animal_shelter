DROP TABLE IF EXISTS pet_owners;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;


CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  picture VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  gender VARCHAR(255),
  date_arrived DATE,
  adoptable VARCHAR(255),
  trained VARCHAR(255),
  current_owner INT8 REFERENCES owners(id)
);


CREATE TABLE pet_owners (
  id SERIAL8 PRIMARY KEY,
  owner_id INT8 REFERENCES owners(id),
  pet_id INT8 REFERENCES pets(id)
);
