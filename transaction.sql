BEGIN;
UPDATE animals 
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name like '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
ROLLBACK;
SELECT * FROM animals

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '01/01/2022';
SAVEPOINT delete_by_birth;
UPDATE animals
SET weight_kg = weight_kg * (-1);
ROLLBACK TO delete_by_birth;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;