CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) not NULL,
    region VARCHAR(50) not NULL
);


INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('David Black', 'Eastern Forest'),
('Ella Brown', 'Western Ridge'),
('Frank Stone', 'Sunset Valley'),
('Grace Lin', 'Misty Pines'),
('Henry Ford', 'Crystal Lake'),
('Isla Chen', 'Golden Savannah'),
('Jack Roy', 'Silent Canyon');


SELECT * FROM rangers


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) not NULL,
    scientific_name VARCHAR(50) not NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) not NULL
);


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
('Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern'),
('Indian Peacock', 'Pavo cristatus', '1758-01-01', 'Least Concern'),
('Great Indian Bustard', 'Ardeotis nigriceps', '1861-01-01', 'Critically Endangered'),
('Himalayan Monal', 'Lophophorus impejanus', '1790-01-01', 'Least Concern'),
('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
('Ganges River Dolphin', 'Platanista gangetica', '1801-01-01', 'Endangered'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Near Threatened'),
('Lion-tailed Macaque', 'Macaca silenus', '1758-01-01', 'Endangered'),
('Indian Star Tortoise', 'Geochelone elegans', '1831-01-01', 'Vulnerable'),
('Nilgiri Tahr', 'Nilgiritragus hylocrius', '1838-01-01', 'Endangered'),
('Blackbuck', 'Antilope cervicapra', '1758-01-01', 'Least Concern');

SELECT * from species

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NOT NULL REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INTEGER NOT NULL REFERENCES species(species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP NOT NULL CHECK (sighting_time <= CURRENT_TIMESTAMP),
    location VARCHAR(50) not NULL DEFAULT 'Unknown',
    notes VARCHAR(100)
);




INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(5, 1, 'Whispering Canyon', '2023-01-15 06:30:27', 'Seen near riverbank'),
(3, 5, 'Mossy Hollow', '2023-03-22 14:50:03', 'Two individuals spotted'),
(2, 6, 'Red Rock Trail', '2023-05-10 10:15:59', 'Tracks found'),
(10, 8, 'Blue Pine Valley', '2023-07-01 07:20:35', 'Swimming observed'),
(1, 9, 'Eagle Point', '2023-08-19 08:10:18', NULL),
(11, 10, 'Foggy Glade', '2023-09-25 17:45:00', 'Burrow entrance located'),
(4, 5, 'Thorny Bush Plains', '2023-10-13 12:30:12', 'Small herd spotted'),
(8, 1, 'Marble Ridge', '2023-11-09 09:00:43', NULL),
(15, 6, 'Sunset Edge', '2024-01-07 15:10:26', 'Running herd'),
(13, 2, 'Riverbend Watchpoint', '2024-03-04 11:00:00', 'Nesting observed'),
(5, 8, 'Willow Creek', '2024-04-02 06:20:49', 'Call heard at dawn'),
(12, 3, 'Shadow Fern Trail', '2024-05-01 16:35:30', NULL),
(1, 6, 'North Slope', '2024-06-08 08:00:00', 'Solo sighting'),
(7, 1, 'Golden Boulder Pass', '2024-08-17 13:45:03', 'Flock in flight'),
(10, 9, 'Rockslide Basin', '2024-09-22 18:25:55', 'Young dolphin observed'),
(3, 2, 'Birchline Edge', '2024-10-19 07:50:17', 'Tree climbing'),
(15, 5, 'Crimson Gap', '2024-12-01 14:10:45', NULL),
(2, 10, 'Jade Cliffs', '2025-01-14 08:45:22', 'Roaring heard'),
(11, 6, 'Crystal Hollow', '2025-03-03 09:30:15', 'Scales spotted'),
(12, 8, 'Emerald Flatlands', '2025-04-28 10:00:00', 'Troop seen grazing');



--**PROBLEM 1**--
INSERT INTO rangers (name, region) VALUES
('Derek Fox', 'Coastal Plains')


--**PROBLEM 2**--
SELECT count(DISTINCT species_id) as unique_species_count FROM sightings


--**PROBLEM 3**--
SELECT * from sightings 
WHERE location ILIKE '%Pass%'


--**PROBLEM 4**--
SELECT name, COUNT(sighting_id) AS total_sightings 
FROM rangers 
LEFT JOIN sightings USING(ranger_id)
GROUP BY name 
ORDER BY total_sightings DESC;

--**PROBLEM 5**__ 
SELECT common_name from species
WHERE species_id not in (SELECT species_id FROM sightings)

--**PROBLEM 6**__
SELECT common_name, sighting_time, name from sightings 
JOIN species USING (species_id)
JOIN rangers USING(ranger_id) 
ORDER BY sighting_time DESC  
LIMIT 2  

--**PROBLEM 7**__
UPDATE species 
SET conservation_status ='HISTORIC'
WHERE extract(year from discovery_date) < 1800
    

--**PROBLEM 8**__
CREATE or REPLACE Function get_time_from_day(p_time TIMESTAMP)
RETURNS VARCHAR(50)
LANGUAGE plpgsql 
as
$$
BEGIN
IF extract(HOUR from p_time) < 12 then
return 'MORNING';
ELSEIF extract(HOUR from p_time) BETWEEN 12 AND 17 THEN
RETURN 'Afternoon';
ELSE
return 'Evening';
END IF;
END
$$

SELECT sighting_id, get_time_from_day(sighting_time) as time_of_day FROM sightings


--*PROBLEM 9*--
DELETE FROM rangers 
WHERE ranger_id NOT in (SELECT ranger_id FROM sightings)
