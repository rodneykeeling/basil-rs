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

INSERT INTO ingredient (id, name) VALUES (1, 'apples');
INSERT INTO ingredient (id, name) VALUES (2, 'avocado');
INSERT INTO ingredient (id, name) VALUES (3, 'bananas');
INSERT INTO ingredient (id, name) VALUES (4, 'basil');
INSERT INTO ingredient (id, name) VALUES (5, 'broccoli');
INSERT INTO ingredient (id, name) VALUES (6, 'butternut squash');
INSERT INTO ingredient (id, name) VALUES (7, 'cauliflower');
INSERT INTO ingredient (id, name) VALUES (8, 'dill');
INSERT INTO ingredient (id, name) VALUES (9, 'garlic');
INSERT INTO ingredient (id, name) VALUES (10, 'ginger');
INSERT INTO ingredient (id, name) VALUES (11, 'green onion');
INSERT INTO ingredient (id, name) VALUES (12, 'habanero');
INSERT INTO ingredient (id, name) VALUES (13, 'hothouse tomato');
INSERT INTO ingredient (id, name) VALUES (14, 'kale');
INSERT INTO ingredient (id, name) VALUES (15, 'lemon');
INSERT INTO ingredient (id, name) VALUES (16, 'lime');
INSERT INTO ingredient (id, name) VALUES (17, 'mushroom');
INSERT INTO ingredient (id, name) VALUES (18, 'potato');
INSERT INTO ingredient (id, name) VALUES (19, 'purple cabbage');
INSERT INTO ingredient (id, name) VALUES (20, 'radicchio');
INSERT INTO ingredient (id, name) VALUES (21, 'red bell');
INSERT INTO ingredient (id, name) VALUES (22, 'salmon');
INSERT INTO ingredient (id, name) VALUES (23, 'serrano');
INSERT INTO ingredient (id, name) VALUES (24, 'shallot');
INSERT INTO ingredient (id, name) VALUES (25, 'shrimp');
INSERT INTO ingredient (id, name) VALUES (26, 'spinach');
INSERT INTO ingredient (id, name) VALUES (27, 'tomato');
INSERT INTO ingredient (id, name) VALUES (28, 'turkey');
INSERT INTO ingredient (id, name) VALUES (29, 'yellow onion');

INSERT INTO ingredient (id, name) VALUES (30, 'oats');
INSERT INTO ingredient (id, name) VALUES (31, 'quinoa');
INSERT INTO ingredient (id, name) VALUES (32, 'sliced almonds');
INSERT INTO ingredient (id, name) VALUES (33, 'sunflower seeds');

INSERT INTO ingredient (id, name) VALUES (34, 'black beans');
INSERT INTO ingredient (id, name) VALUES (35, 'butter beans');
INSERT INTO ingredient (id, name) VALUES (36, 'canola oil');
INSERT INTO ingredient (id, name) VALUES (37, 'capers');
INSERT INTO ingredient (id, name) VALUES (38, 'coconut cream');
INSERT INTO ingredient (id, name) VALUES (39, 'coconut milk');
INSERT INTO ingredient (id, name) VALUES (40, 'corn tortillas');
INSERT INTO ingredient (id, name) VALUES (41, 'garbanzo beans');
INSERT INTO ingredient (id, name) VALUES (42, 'ghee');
INSERT INTO ingredient (id, name) VALUES (43, 'mayo');
INSERT INTO ingredient (id, name) VALUES (44, 'olive oil');
INSERT INTO ingredient (id, name) VALUES (45, 'olives');
INSERT INTO ingredient (id, name) VALUES (46, 'oyster sauce');
INSERT INTO ingredient (id, name) VALUES (47, 'peanut oil');
INSERT INTO ingredient (id, name) VALUES (48, 'red curry paste');
INSERT INTO ingredient (id, name) VALUES (49, 'sliced olives');

INSERT INTO ingredient (id, name) VALUES (50, 'black pepper');
INSERT INTO ingredient (id, name) VALUES (51, 'cereal');
INSERT INTO ingredient (id, name) VALUES (52, 'diced canned tomato');
INSERT INTO ingredient (id, name) VALUES (53, 'packaged oatmeal');
INSERT INTO ingredient (id, name) VALUES (54, 'pasta');
INSERT INTO ingredient (id, name) VALUES (55, 'rice');
INSERT INTO ingredient (id, name) VALUES (56, 'salt');
INSERT INTO ingredient (id, name) VALUES (57, 'taco seasoning');
INSERT INTO ingredient (id, name) VALUES (58, 'vegetable broth');

INSERT INTO ingredient (id, name) VALUES (59, 'bagels');
INSERT INTO ingredient (id, name) VALUES (60, 'honey');
INSERT INTO ingredient (id, name) VALUES (61, 'maple syrup');
INSERT INTO ingredient (id, name) VALUES (62, 'peanut butter');

INSERT INTO ingredient (id, name) VALUES (63, 'baguette');
INSERT INTO ingredient (id, name) VALUES (64, 'burritos');
INSERT INTO ingredient (id, name) VALUES (65, 'edamame');
INSERT INTO ingredient (id, name) VALUES (66, 'frozen berries');

INSERT INTO ingredient (id, name) VALUES (67, 'almond milk');
INSERT INTO ingredient (id, name) VALUES (68, 'butter');
INSERT INTO ingredient (id, name) VALUES (69, 'cheddar');
INSERT INTO ingredient (id, name) VALUES (70, 'eggs');
INSERT INTO ingredient (id, name) VALUES (71, 'parmesan');
INSERT INTO ingredient (id, name) VALUES (72, 'sour cream');
INSERT INTO ingredient (id, name) VALUES (73, 'tofu');

INSERT INTO ingredient (id, name) VALUES (74, 'kombucha');

INSERT INTO ingredient (id, name) VALUES (75, 'passata');

INSERT INTO location (id, name) VALUES (1, 'produce');
INSERT INTO location (id, name) VALUES (2, 'bulk');
INSERT INTO location (id, name) VALUES (3, 'international');
INSERT INTO location (id, name) VALUES (4, 'pasta');
INSERT INTO location (id, name) VALUES (5, 'bread');
INSERT INTO location (id, name) VALUES (6, 'frozen');
INSERT INTO location (id, name) VALUES (7, 'dairy');
INSERT INTO location (id, name) VALUES (8, 'other');

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (1, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (2, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (3, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (4, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (5, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (6, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (7, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (8, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (9, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (10, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (11, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (12, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (13, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (14, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (15, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (16, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (17, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (18, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (19, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (21, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (22, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (23, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (24, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (25, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (26, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (27, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (28, 1);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (29, 1);

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (30, 2);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (31, 2);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (32, 2);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (33, 2);

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (34, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (35, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (36, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (37, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (38, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (39, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (40, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (41, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (42, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (43, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (44, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (45, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (46, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (47, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (48, 3);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (49, 3);

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (50, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (51, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (52, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (53, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (54, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (55, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (56, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (57, 4);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (58, 4);

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (59, 5);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (60, 5);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (61, 5);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (62, 5);

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (63, 6);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (64, 6);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (65, 6);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (66, 6);

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (67, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (68, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (69, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (70, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (71, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (72, 7);
INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (73, 7);

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (74, 8);

INSERT INTO ingredient_location (ingredient_id, location_id) VALUES (75, 4);

INSERT INTO recipe (id, name) VALUES (1, 'pasta');

INSERT INTO recipe_ingredient VALUES (1, 54);
INSERT INTO recipe_ingredient VALUES (1, 4);
INSERT INTO recipe_ingredient VALUES (1, 9);
INSERT INTO recipe_ingredient VALUES (1, 75);
INSERT INTO recipe_ingredient VALUES (1, 45);
INSERT INTO recipe_ingredient VALUES (1, 37);
