-- Create the 'movies' table
CREATE TABLE movies (
    movie_id serial PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    director VARCHAR(100),
    opening_crawl TEXT
);

-- Create the 'planets' table
CREATE TABLE planets (
    planet_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    climate VARCHAR(100),
    terrain VARCHAR(100),
    population INT,
    featured_in_movie_id INT REFERENCES movies(movie_id)
);

-- Create the 'characters' table
CREATE TABLE characters (
    character_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    species VARCHAR(50),
    birth_year VARCHAR(10),
    height DECIMAL(5, 2),
    homeworld_id INT REFERENCES planets(planet_id),
    appears_in_movie_id INT REFERENCES movies(movie_id)
);

-- Create the 'homeworlds' table
CREATE TABLE homeworlds (
    homeworld_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    climate VARCHAR(100),
    terrain VARCHAR(100),
    population INT
);

-- Sample data for 'movies' table
INSERT INTO movies (title, release_year, director, opening_crawl)
VALUES
    ('A New Hope', 1977, 'George Lucas', 'A long time ago in a galaxy far, far away...'),
    ('The Empire Strikes Back', 1980, 'Irvin Kershner', 'It is a dark time for the Rebellion...'),
    ('Return of the Jedi', 1983, 'Richard Marquand', 'Luke Skywalker has returned to his home planet...');

-- Sample data for 'planets' table
INSERT INTO planets (name, climate, terrain, population, featured_in_movie_id)
VALUES
    ('Tatooine', 'Arid', 'Desert', 200000, 1),
    ('Hoth', 'Frozen', 'Tundra', 0, 2),
    ('Endor', 'Temperate', 'Forest', 30000000, 3);

-- Sample data for 'homeworlds' table
INSERT INTO homeworlds (name, climate, terrain, population)
VALUES
    ('Tatooine', 'Arid', 'Desert', 200000),
    ('Hoth', 'Frozen', 'Tundra', 0),
    ('Endor', 'Temperate', 'Forest', 30000000);

-- Sample data for 'characters' table (24 characters)
INSERT INTO characters (name, species, birth_year, height, homeworld_id, appears_in_movie_id)
VALUES
    ('Luke Skywalker', 'Human', '19 BBY', 1.72, 1, 1),
    ('Princess Leia', 'Human', '19 BBY', 1.50, 1, 1),
    ('Darth Vader', 'Human', '41.9 BBY', 2.02, 1, 1),
    ('Han Solo', 'Human', '29 BBY', 1.80, 1, 1),
    ('Yoda', 'Unknown', '896 BBY', 0.66, 3, 1),
    ('R2-D2', 'Droid', '33 BBY', 0.96, 1, 1),
    ('C-3PO', 'Droid', '112 BBY', 1.67, 1, 1),
    ('Obi-Wan Kenobi', 'Human', '57 BBY', 1.78, 1, 1),
    ('Chewbacca', 'Wookiee', '200 BBY', 2.28, 1, 1),
    ('Lando Calrissian', 'Human', '31 BBY', 1.77, 1, 1),
    ('Boba Fett', 'Human', '31.5 BBY', 1.83, 1, 2),
    ('Emperor Palpatine', 'Human', '84 BBY', 1.73, 1, 2),
    ('Darth Maul', 'Zabrak', '54 BBY', 1.80, 3, 2),
    ('Padmé Amidala', 'Human', '46 BBY', 1.65, 2, 2),
    ('Anakin Skywalker', 'Human', '41.9 BBY', 1.88, 1, 2),
    ('Mace Windu', 'Human', '72 BBY', 1.92, 1, 2),
    ('Qui-Gon Jinn', 'Human', '92 BBY', 1.93, 2, 2),
    ('Jar Jar Binks', 'Gungan', '52 BBY', 1.96, 2, 2),
    ('Princess Amidala', 'Human', '46 BBY', 1.65, 2, 2),
    ('Rey', 'Human', '15 ABY', 1.7, 1, 3),
    ('Finn', 'Human', 'unknown', 1.78, 2, 3),
    ('Kylo Ren', 'Human', '5 ABY', 1.89, 1, 3),
    ('Poe Dameron', 'Human', 'unknown', 1.74, 2, 3),
    ('BB-8', 'Droid', 'unknown', 0.67, 3, 3);
