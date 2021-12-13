/* Populate database with sample data. */

-- owners info
INSERT INTO owners (full_name, age )
VALUES ('Sam Smith', 34)
VALUES ('Jennifer Orwell', 19)
VALUES ('Bob', 45)
VALUES ('Melody Pond', 77)
VALUES ('Dean Winchester', 14)
VALUES ('Jodie Whittaker', 38);

-- species info
INSERT INTO species (name)
VALUES('Pokemon'),
VALUES('Digimon');

-- animal data
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
VALUES ('Agumon', '02/03/2020', 10.23, true, 0, 2, 1),
 ('Gabumon', '15/11/2018', 5, true, 2, 2, 2),
 ('Pikachu', '01/07/2021', 15.04,false, 1, 1,2 ),
 ('Devimon', '05/12/2017', 11, true, 5, 2,3),
('Charmander', '02/08/2020', 11, false, 0, 1, 4),
('Plantmon', '15/11/2022', 5.7, true, 2,2,3),
('Squirtle', '02/04/1993', 12.13, false, 3,1,4),
('Angemon', '12/01/2005', 45, true, 1,2,5),
('Boarmon', '07/06/2005', 20.4, true, 7,2,5),
('Blossom', '13/10/1998', 17, true, 3,1,4);

-- vets

INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '23/04/2000'),
  ('Maisy Smith', 26, '17/1/2019'),
  ('Stephanie Mendez', 64, '04/05/1981'),
  ('Jack Harkness', 38, '08/06/2008');

  INSERT INTO specializations (species_id, vet_id)
VALUES
  (1, 1),
  (1, 3),
  (2, 3),
  (2, 4);

--   visits

INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES
  (1, 1, '2020-5-24'),
  (1, 3, '2020-7-22'),
  (2, 4, '2021-2-2'),
  (3, 2, '2020-1-5'),
  (3, 2, '2020-3-8'),
  (3, 2, '2020-5-14'),
  (4, 3, '2021-5-4'),
  (5, 4, '2021-2-24'),
  (6, 2, '2019-12-21'),
  (6, 1, '2020-8-10'),
  (6, 2, '2021-4-7'),
  (7, 3, '2019-9-29'),
  (8, 4, '2020-10-3'),
  (8, 4, '2020-11-4'),
  (9, 2, '2019-1-24'),
  (9, 2, '2019-5-15'),
  (9, 2, '2020-2-27'),
  (9, 2, '2020-8-3'),
  (10, 3, '2020-5-24'),
  (10, 1, '2021-1-11');