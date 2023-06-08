/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    ('Agumon', '2020-02-03', 0, TRUE, 10.23),
    ('Gabumon', '2018-11-15', 2, TRUE, 8),
    ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
    ('Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
    ('Charmander', '2020-02-08', 0, false, -11, 'Fire'),
    ('Plantmon', '2021-11-15', 2, true, -5.7, 'Grass'),
    ('Squirtle', '1993-04-02', 3, false, -12.13, 'Water'),
    ('Angemon', '2005-06-12', 1, true, -45, 'Angel'),
    ('Boarmon', '2005-06-07', 7, true, 20.4, 'Beast'),
    ('Blossom', '1998-10-13', 3, true, 17, 'Flower'),
    ('Ditto', '2022-05-14', 4, true, 22, 'Normal');
INSERT INTO owners (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);
INSERT INTO species (name)
VALUES
  ('Pokemon'),
  ('Digimon');
UPDATE animals
SET species_id = CASE
    WHEN name ILIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END;
UPDATE animals
SET owner_id = CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  END;
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specialties (vet_id, name)
VALUES (vet_id_for_William_Tatcher, 'Pokemon'),
       (vet_id_for_Stephanie_Mendez, 'Digimon'),
       (vet_id_for_Stephanie_Mendez, 'Pokemon'),
       (vet_id_for_Jack_Harkness, 'Digimon');

INSERT INTO specialties (vet_id, name)
VALUES (1, 'Pokemon'),
       (3, 'Digimon'),
       (3, 'Pokemon'),
       (4, 'Digimon');

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), (SELECT id FROM animals WHERE name = 'Agumon' LIMIT 1), '2020-07-22'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), (SELECT id FROM animals WHERE name = 'Gabumon' LIMIT 1), '2021-02-02'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), '2020-01-05'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), '2020-03-08'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Pikachu' LIMIT 1), '2021-01-11'),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), (SELECT id FROM animals WHERE name = 'Devimon' LIMIT 1), '2021-05-04'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), (SELECT id FROM animals WHERE name = 'Charmander' LIMIT 1), '2021-02-24'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), '2019-12-21'),
  ((SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1), (SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), '2020-08-10'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), '2021-04-07'),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), (SELECT id FROM animals WHERE name = 'Squirtle' LIMIT 1), '2019-09-29'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), (SELECT id FROM animals WHERE name = 'Angemon' LIMIT 1), '2020-10-03'),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness' LIMIT 1), (SELECT id FROM animals WHERE name = 'Angemon' LIMIT 1), '2020-11-04'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), '2019-01-24'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), '2019-05-15'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), '2020-02-27'),
  ((SELECT id FROM vets WHERE name = 'Maisy Smith' LIMIT 1), (SELECT id FROM animals WHERE name = 'Boarmon' LIMIT 1), '2020-08-03'),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez' LIMIT 1), (SELECT id FROM animals WHERE name = 'Blossom' LIMIT 1), '2020-05-24'),
  ((SELECT id FROM vets WHERE name = 'William Tatcher' LIMIT 1), (SELECT id FROM animals WHERE name = 'Plantmon' LIMIT 1), '2021-06-08');
