/* Populate database with sample data. */

-- owners info
INSERT INTO owners (full_name, age )
VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age )
VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age )
VALUES ('Bob', 45);
INSERT INTO owners (full_name, age )
VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age )
VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age )
VALUES ('Jodie Whittaker', 38);

-- species info
INSERT INTO species (name)
values('Pokemon');
INSERT INTO species (name)
VALUES('Digimon');

-- animal data
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
VALUES ('Agumon', '02/03/2020', 10.23, true, 0, 2, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
VALUES ('Gabumon', '11/15/2018', 5, true, 2, 2, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
VALUES ('Pikachu', '01/07/2021', 15.04,false, 1, 1,2 );
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
VALUES ('Devimon', '05/12/2017', 11, true, 5, 2,3);
INSERT INTO mascota (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
values('Charmander', '02/08/2020', 11, false, 0, 1, 4);
INSERT INTO mascota (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
values('Plantmon', '15/11/2022', 5.7, true, 2,2,3);
INSERT INTO mascota (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
values('Squirtle', '02/04/1993', 12.13, false, 3,1,4);
INSERT INTO mascota (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
values('Angemon', '12/01/2005', 45, true, 1,2,5);
INSERT INTO mascota (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
values('Boarmon', '07/06/2005', 20.4, true, 7,2,5);
INSERT INTO mascota (name, date_of_birth, weight_kg, neutered, escape_attempts, species_id, owner_id)
values('Blossom', '13/10/1998', 17, true, 3,1,4);
