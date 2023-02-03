SELECT 'CREATE DATABASE basil' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'basil');

DROP TABLE recipe;
DROP TABLE ingredient;
DROP TABLE location;
DROP TABLE recipe_ingredient;
DROP TABLE ingredient_location;

CREATE TABLE IF NOT EXISTS recipe(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ingredient(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS location(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS recipe_ingredient(
    recipe_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS ingredient_location(
    ingredient_id INTEGER NOT NULL,
    location_id INTEGER NOT NULL
);

INSERT INTO ingredient (id, name) values (1, 'apples');
INSERT INTO ingredient (id, name) values (2, 'avocado');
INSERT INTO ingredient (id, name) values (3, 'bananas');
INSERT INTO ingredient (id, name) values (4, 'basil');
INSERT INTO ingredient (id, name) values (5, 'broccoli');
INSERT INTO ingredient (id, name) values (6, 'garlic');
INSERT INTO ingredient (id, name) values (7, 'ginger');
INSERT INTO ingredient (id, name) values (8, 'habanero');
INSERT INTO ingredient (id, name) values (9, 'hothouse tomato');
INSERT INTO ingredient (id, name) values (10, 'kale');
INSERT INTO ingredient (id, name) values (11, 'lemon');
INSERT INTO ingredient (id, name) values (12, 'lime');
INSERT INTO ingredient (id, name) values (13, 'mushroom');
INSERT INTO ingredient (id, name) values (14, 'red bell');
INSERT INTO ingredient (id, name) values (15, 'shrimp');
INSERT INTO ingredient (id, name) values (16, 'tomato');
INSERT INTO ingredient (id, name) values (17, 'yellow onion');
INSERT INTO ingredient (id, name) values (18, 'oats');
INSERT INTO ingredient (id, name) values (19, 'black beans');
INSERT INTO ingredient (id, name) values (20, 'butter beans');
INSERT INTO ingredient (id, name) values (21, 'canola oil');
INSERT INTO ingredient (id, name) values (22, 'capers');
INSERT INTO ingredient (id, name) values (23, 'olive oil');
INSERT INTO ingredient (id, name) values (24, 'olives');
INSERT INTO ingredient (id, name) values (25, 'peanut oil');
INSERT INTO ingredient (id, name) values (26, 'rice');
INSERT INTO ingredient (id, name) values (27, 'salt');
INSERT INTO ingredient (id, name) values (28, 'vegetable broth');
INSERT INTO ingredient (id, name) values (29, 'maple syrup');
INSERT INTO ingredient (id, name) values (30, 'peanut butter');
INSERT INTO ingredient (id, name) values (31, 'frozen berries');
INSERT INTO ingredient (id, name) values (32, 'almond milk');
INSERT INTO ingredient (id, name) values (33, 'cheddar');
INSERT INTO ingredient (id, name) values (34, 'eggs');
INSERT INTO ingredient (id, name) values (35, 'parmesan');
INSERT INTO ingredient (id, name) values (36, 'sour cream');
INSERT INTO ingredient (id, name) values (37, 'tofu');
INSERT INTO ingredient (id, name) values (38, 'kombucha');

INSERT INTO location (id, name) values (1, 'produce');
INSERT INTO location (id, name) values (2, 'bulk');
INSERT INTO location (id, name) values (3, 'international');
INSERT INTO location (id, name) values (4, 'pasta');
INSERT INTO location (id, name) values (5, 'bread');
INSERT INTO location (id, name) values (6, 'frozen');
INSERT INTO location (id, name) values (7, 'dairy');
INSERT INTO location (id, name) values (8, 'other');

INSERT INTO ingredient_location (ingredient_id, location_id) values (1, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (2, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (3, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (4, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (5, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (6, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (7, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (8, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (9, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (10, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (11, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (12, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (13, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (14, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (15, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (16, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (17, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (18, 2);
INSERT INTO ingredient_location (ingredient_id, location_id) values (19, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (20, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (21, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (22, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (23, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (24, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (25, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (26, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (27, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (28, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (29, 5);
INSERT INTO ingredient_location (ingredient_id, location_id) values (30, 5);
INSERT INTO ingredient_location (ingredient_id, location_id) values (31, 6);
INSERT INTO ingredient_location (ingredient_id, location_id) values (32, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (33, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (34, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (35, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (36, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (37, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (38, 8);
