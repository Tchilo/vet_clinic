DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS specializations;

-- create a table named vets
CREATE TABLE vets (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250),
  age INT,
  date_of_graduation date
);

-- create a table named owners
CREATE TABLE owners (
  id SERIAL NOT NULL PRIMARY KEY,
  full_name VARCHAR(250),
  age INT
);

-- create a table named species
CREATE TABLE species (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250)
);

CREATE TABLE animals (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(250),
  date_of_birth date,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  species_id INT,
  owner_id INT,
  CONSTRAINT fk_species
    FOREIGN KEY(species_id)
      REFERENCES species(id),
  CONSTRAINT fk_owners
    FOREIGN KEY(owner_id)
      REFERENCES owners(id)
);

-- create a join table named specializations
CREATE TABLE specializations (
  species_id INT,
  vet_id INT,
  CONSTRAINT fk_species
    FOREIGN KEY(species_id)
      REFERENCES species(id),
  CONSTRAINT fk_vets
    FOREIGN KEY(vet_id)
      REFERENCES vets(id)
);

-- create a join table named visits
CREATE TABLE visits (
  animals_id INT,
  vets_id INT,
  date_of_visit date,
  CONSTRAINT fk_animals
    FOREIGN KEY(animals_id)
      REFERENCES animals(id),
  CONSTRAINT fk_vets
    FOREIGN KEY(vets_id)
      REFERENCES vets(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

CREATE INDEX animals_id ON visits(animals_id);
CREATE INDEX visits_id ON visits(vets_id);
CREATE INDEX owners_mail ON owners(email ASC);