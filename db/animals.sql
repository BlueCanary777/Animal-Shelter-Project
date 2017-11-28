DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners (
  id serial4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE animals (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  admission_date DATE,
  adoptable BOOLEAN,
  owner_id int4 REFERENCES owners(id)
);
