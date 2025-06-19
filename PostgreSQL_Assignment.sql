-- Active: 1748167816455@@localhost@5432@conservation_db
CREATE DATABASE conservation_db;

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region  VARCHAR(200)
);




CREATE TABLE species(
  species_id SERIAL PRIMARY KEY,
   common_name VARCHAR(200),
    scientific_name VARCHAR(200) ,
    discovery_date DATE,
    conservation_status VARCHAR(100)
 )



CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER REFERENCES species(species_id),
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    location  VARCHAR(100) ,
    sighting_time TIMESTAMP ,
    notes VARCHAR(300)
);




INSERT INTO  rangers(name, region) VALUES
  ('Alice Green', 'Northern Hills'),
  ('Bob White', 'River Delta'),
  ('Carol King', 'Mountain Range')

  INSERT INTO species(common_name,scientific_name ,discovery_date, conservation_status  ) VALUES
  ('Snow Leopard','Panthera uncia ', '1775-01-01 ' ,'Endangered ' ),
  ('Bengal Tiger ', 'Panthera tigris tigris ', '1758-01-01 ', 'Endangered '),
  ('Red Panda', 'Ailurus fulgens ', '1825-01-01 ', 'Vulnerable  '),
  ('Asiatic Elephant', 'Elephas maximus indicus', ' 1758-01-01 ', 'Endangered   ')

  INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES
   (1, 1, 'Peak Ridge', TO_TIMESTAMP('2024-05-10 07:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'Camera trap image captured'),
   (2, 2, 'Bankwood Area', TO_TIMESTAMP('2024-05-12 16:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'Juvenile seen'),
   (3, 3, 'Bamboo Grove East', TO_TIMESTAMP('2024-05-15 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Feeding observed'),
   (1, 2, 'Snowfall Pass', TO_TIMESTAMP('2024-05-18 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);

--    problem -1
 INSERT INTO rangers(name, region) VALUES ('Derek Fox', 'Coastal Plains');

 --- problem -2
  
  SELECT count(DISTINCT species_id) as unique_species_count  FROM  sightings

--  problem --3
Select  * From sightings 
  WHERE location ILIKE '%pass';

--- problem  ---4
SELECT ranger.name, COUNT(sepices.id) AS total_sightings
FROM rangers ranger
LEFT JOIN sightings sepices ON ranger.id = sepices.ranger_id
GROUP BY ranger.id, ranger.name 
ORDER BY total_sightings  ;

----- problem ---5
SELECT species.common_name
  FROM species
   LEFT JOIN sightings ON species.id = sightings.species_id
   WHERE sightings.species_id IS NULL;

--    problem --6 
 SELECT rangers.name,
 species.common_name,
 sightings.sighting_time
 From sightings
 JOIN rangers on sightings.ranger_id = rangers.id
 JOIN species ON sightings.species_id = species.id
 ORDER BY sighting_time DESC
 LIMIT 2;

--   problem --7
 UPDATE species set conservation_status = 'Historic'
 WHERE discovery_date  < DATE '1800-01-01';

--  problem---8
SELECT
    id AS sighting_id,
    CASE
        WHEN  sighting_time:: time  < TIME '12:00' THEN 'Morning'
        WHEN  sighting_time:: time  < TIME '17:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;


-----problem ---9
DELETE FROM rangers
WHERE id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);




   SELECT * FROM rangers;
   
   SELECT * FROM species;

   SELECT * FROM sightings;

   