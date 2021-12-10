/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name like '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name  IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT name from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


SELECT COUNT(*) FROM animals;

SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT name, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

SELECT species, MAX(weight_kg), MIN(weight_kg) from animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01/01/1990' AND '01/01/2000' GROUP BY species;


-- Melody Pond's pets 
SELECT name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

-- pokemon species
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- who have pets and who don't
SELECT animals.name, owners.full_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- animals per species
SELECT species.name, COUNT(species.name)
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- Jennifer Orwell's digimon pets
SELECT animals.name, owners.full_name, species.name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- Dean Winchester's escape pets 
SELECT animals.name, owners.full_name, animals.escape_attempts
FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- who has a lot of pets

SELECT owners.full_name, COUNT(animals.name)
FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name;