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
INSERT INTO ingredient (id, name) values (6, 'butternut squash');
INSERT INTO ingredient (id, name) values (7, 'cauliflower');
INSERT INTO ingredient (id, name) values (8, 'dill');
INSERT INTO ingredient (id, name) values (9, 'garlic');
INSERT INTO ingredient (id, name) values (10, 'ginger');
INSERT INTO ingredient (id, name) values (11, 'green onion');
INSERT INTO ingredient (id, name) values (12, 'habanero');
INSERT INTO ingredient (id, name) values (13, 'hothouse tomato');
INSERT INTO ingredient (id, name) values (14, 'kale');
INSERT INTO ingredient (id, name) values (15, 'lemon');
INSERT INTO ingredient (id, name) values (16, 'lime');
INSERT INTO ingredient (id, name) values (17, 'mushroom');
INSERT INTO ingredient (id, name) values (18, 'potato');
INSERT INTO ingredient (id, name) values (19, 'purple cabbage');
INSERT INTO ingredient (id, name) values (20, 'radicchio');
INSERT INTO ingredient (id, name) values (21, 'red bell');
INSERT INTO ingredient (id, name) values (22, 'salmon');
INSERT INTO ingredient (id, name) values (23, 'serrano');
INSERT INTO ingredient (id, name) values (24, 'shallot');
INSERT INTO ingredient (id, name) values (25, 'shrimp');
INSERT INTO ingredient (id, name) values (26, 'spinach');
INSERT INTO ingredient (id, name) values (27, 'tomato');
INSERT INTO ingredient (id, name) values (28, 'turkey');
INSERT INTO ingredient (id, name) values (29, 'yellow onion');

INSERT INTO ingredient (id, name) values (30, 'oats');
INSERT INTO ingredient (id, name) values (31, 'quinoa');
INSERT INTO ingredient (id, name) values (32, 'sliced almonds');
INSERT INTO ingredient (id, name) values (33, 'sunflower seeds');

INSERT INTO ingredient (id, name) values (34, 'black beans');
INSERT INTO ingredient (id, name) values (35, 'butter beans');
INSERT INTO ingredient (id, name) values (36, 'canola oil');
INSERT INTO ingredient (id, name) values (37, 'capers');
INSERT INTO ingredient (id, name) values (38, 'coconut cream');
INSERT INTO ingredient (id, name) values (39, 'coconut milk');
INSERT INTO ingredient (id, name) values (40, 'corn tortillas');
INSERT INTO ingredient (id, name) values (41, 'garbanzo beans');
INSERT INTO ingredient (id, name) values (42, 'ghee');
INSERT INTO ingredient (id, name) values (43, 'mayo');
INSERT INTO ingredient (id, name) values (44, 'olive oil');
INSERT INTO ingredient (id, name) values (45, 'olives');
INSERT INTO ingredient (id, name) values (46, 'oyster sauce');
INSERT INTO ingredient (id, name) values (47, 'peanut oil');
INSERT INTO ingredient (id, name) values (48, 'red curry paste');
INSERT INTO ingredient (id, name) values (49, 'sliced olives');

INSERT INTO ingredient (id, name) values (50, 'black pepper');
INSERT INTO ingredient (id, name) values (51, 'cereal');
INSERT INTO ingredient (id, name) values (52, 'diced canned tomato');
INSERT INTO ingredient (id, name) values (53, 'packaged oatmeal');
INSERT INTO ingredient (id, name) values (54, 'rice');
INSERT INTO ingredient (id, name) values (55, 'salt');
INSERT INTO ingredient (id, name) values (56, 'taco seasoning');
INSERT INTO ingredient (id, name) values (57, 'vegetable broth');

INSERT INTO ingredient (id, name) values (58, 'bagels');
INSERT INTO ingredient (id, name) values (59, 'honey');
INSERT INTO ingredient (id, name) values (60, 'maple syrup');
INSERT INTO ingredient (id, name) values (61, 'peanut butter');

INSERT INTO ingredient (id, name) values (62, 'baguette');
INSERT INTO ingredient (id, name) values (63, 'burritos');
INSERT INTO ingredient (id, name) values (64, 'edamame');
INSERT INTO ingredient (id, name) values (65, 'frozen berries');

INSERT INTO ingredient (id, name) values (66, 'almond milk');
INSERT INTO ingredient (id, name) values (67, 'butter');
INSERT INTO ingredient (id, name) values (68, 'cheddar');
INSERT INTO ingredient (id, name) values (69, 'eggs');
INSERT INTO ingredient (id, name) values (70, 'parmesan');
INSERT INTO ingredient (id, name) values (71, 'sour cream');
INSERT INTO ingredient (id, name) values (72, 'tofu');

INSERT INTO ingredient (id, name) values (73, 'kombucha');

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
INSERT INTO ingredient_location (ingredient_id, location_id) values (18, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (19, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (21, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (22, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (23, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (24, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (25, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (26, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (27, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (28, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) values (29, 1);

INSERT INTO ingredient_location (ingredient_id, location_id) values (30, 2);
INSERT INTO ingredient_location (ingredient_id, location_id) values (31, 2);
INSERT INTO ingredient_location (ingredient_id, location_id) values (32, 2);
INSERT INTO ingredient_location (ingredient_id, location_id) values (33, 2);

INSERT INTO ingredient_location (ingredient_id, location_id) values (34, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (35, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (36, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (37, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (38, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (39, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (40, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (41, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (42, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (43, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (44, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (45, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (46, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (47, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (48, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) values (49, 3);

INSERT INTO ingredient_location (ingredient_id, location_id) values (50, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (51, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (52, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (53, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (54, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (55, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (56, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) values (57, 4);

INSERT INTO ingredient_location (ingredient_id, location_id) values (58, 5);
INSERT INTO ingredient_location (ingredient_id, location_id) values (59, 5);
INSERT INTO ingredient_location (ingredient_id, location_id) values (60, 5);
INSERT INTO ingredient_location (ingredient_id, location_id) values (61, 5);

INSERT INTO ingredient_location (ingredient_id, location_id) values (62, 6);
INSERT INTO ingredient_location (ingredient_id, location_id) values (63, 6);
INSERT INTO ingredient_location (ingredient_id, location_id) values (64, 6);
INSERT INTO ingredient_location (ingredient_id, location_id) values (65, 6);

INSERT INTO ingredient_location (ingredient_id, location_id) values (66, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (67, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (68, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (69, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (70, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (71, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) values (72, 7);

INSERT INTO ingredient_location (ingredient_id, location_id) values (73, 8);
