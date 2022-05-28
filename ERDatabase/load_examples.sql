SET FOREIGN_KEY_CHECKS = 0;

/* Entities *\
\* -------- */

LOAD DATA LOCAL INFILE 'Recipe.csv'
	INTO TABLE Club
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(id, name, description);

LOAD DATA LOCAL INFILE 'Food.csv'
	INTO TABLE Membre
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(id, name, fat, sugar, kcal);

LOAD DATA LOCAL INFILE 'KitchenTool.csv'
	INTO TABLE Cheval
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(id, name, instructions_for_use);

/* Multi-valued list *\
\* ----------------- */

LOAD DATA LOCAL INFILE 'Categories.csv'
	INTO TABLE ProprieteDe
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(food_id, cat_id);

/* Weak entities *\
\* ------------- */

LOAD DATA LOCAL INFILE 'Step.csv'
	INTO TABLE Competition
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(recipe_id, step_nb, description);

/* Relations *\
\* --------- */

LOAD DATA LOCAL INFILE 'HasIngredient.csv'
	INTO TABLE Obstacle
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(recipe_id, step_nb, food_id, unit, value);

LOAD DATA LOCAL INFILE 'UsesTool.csv'
	INTO TABLE Obstacle
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(recipe_id, step_nb, tool_id);