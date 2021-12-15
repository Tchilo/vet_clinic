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

-- Join tables queries
-- Who was the last animal seen by William Tatcher?
SELECT animals.name, vets.name, date_of_visit
FROM visits
JOIN animals ON animals.id = animals_id
JOIN vets ON vets.id = vets_id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(animals_id)
FROM visits
JOIN animals ON animals.id = animals_id
JOIN vets ON vets.id = vets_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name
FROM vets
LEFT JOIN specializations ON vet_id = vets.id
LEFT JOIN species ON species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name
FROM visits
JOIN animals ON animals_id = animals.id
JOIN vets ON vets_id = vets.id
WHERE date_of_visit BETWEEN '2020-4-1' AND '2020-8-30' AND vets.name = 'Stephanie Mendez'
ORDER BY animals.name;

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(animals.name)
FROM visits
JOIN animals ON animals_id = animals.id
JOIN vets ON vets_id = vets.id
GROUP BY animals.name
ORDER BY COUNT(animals.name) DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name, vets.name, date_of_visit
FROM visits
JOIN animals ON animals.id = animals_id
JOIN vets ON vets.id = vets_id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT
  animals.name,
  animals.date_of_birth,
  animals.escape_attempts,
  animals.neutered,
  animals.weight_kg,
  vets.name,
  vets.age,
  vets.date_of_graduation,
  visits.date_of_visit
FROM visits
JOIN animals ON animals_id = animals.id
JOIN vets ON vets_id = vets.id
ORDER BY date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT(date_of_visit)
FROM vets
LEFT JOIN visits
ON vets.id = visits.vets_id
LEFT JOIN specializations
ON vets.id = specializations.vet_id
WHERE specializations.species_id IS NULL
GROUP BY vets.name;


-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(species.name)
FROM visits
JOIN animals ON animals_id = animals.id
JOIN vets ON vets_id = vets.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species.name) DESC LIMIT 1;

/* BEFORE CHANGES (indices) */
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4; /* 1787 ms */
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2; /* 600ms */
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com'; /* 3000+ms */

/* AFTER CHANGES (indices) */

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4; /* 786ms */
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2; 
/* 843ms */
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com'; /* 0.076 ms */ 