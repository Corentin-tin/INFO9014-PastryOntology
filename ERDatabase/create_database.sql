/* Entities *\
\* -------- */

-- Recipe
CREATE TABLE IF NOT EXISTS Recipe(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(500) NOT NULL
);

-- Food
CREATE TABLE IF NOT EXISTS Food(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    fat DECIMAL NOT NULL, --g per 100g/100ml
    sugar DECIMAL NOT NULL, --g per 100g/100ml
    kcal DECIMAL NOT NULL --g per 100g/100ml
);

-- Kitchen Tool
CREATE TABLE IF NOT EXISTS Kitchen_Tool(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    instructions_for_use VARCHAR(500) NOT NULL
);

/* Multi-valued list *\
\* ----------------- */

CREATE TABLE IF NOT EXISTS Categories(
    cat_id INTEGER NOT NULL,
    food_id INTEGER NOT NULL,
    Category VARCHAR(500) NOT NULL,
    PRIMARY KEY (cat_id, food_id)
    FOREIGN KEY (food_id) REFERENCES Food(id)
);

/* Weak entities *\
\* ------------- */

-- Step from Recipe
CREATE TABLE IF NOT EXISTS Step(
    recipe_id INTEGER NOT NULL,
    step_nb INTEGER NOT NULL UNIQUE,
    description VARCHAR(500) NOT NULL,
    PRIMARY KEY (step_nb, recipe_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id)
);

/* Relations *\
\* --------- */

-- All the required tools
CREATE TABLE IF NOT EXISTS UsesTool(
    recipe_id INTEGER NOT NULL,
    step_nb INTEGER NOT NULL,
    tool_id INTEGER NOT NULL,
    PRIMARY KEY (recipe_id, step_nb, tool_id),
    FOREIGN KEY (recipe_id, step_nb) REFERENCES Step(recipe_id, step_nb)
    FOREIGN KEY (tool_id) REFERENCES Step(tool_id)
);

-- All the required food
CREATE TABLE IF NOT EXISTS HasIngredient(
    recipe_id INTEGER NOT NULL,
    step_nb INTEGER NOT NULL,
    food_id INTEGER NOT NULL,
    unit VARCHAR(50) NOT NULL,
    value REAL NOT NULL,
    PRIMARY KEY (recipe_id, step_nb, food_id),
    FOREIGN KEY (recipe_id, step_nb) REFERENCES Step(recipe_id, step_nb)
    FOREIGN KEY (food_id) REFERENCES Step(food_id)
);
