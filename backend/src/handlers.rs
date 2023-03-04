use axum::{extract::State, Json};
use axum_extra::extract::Form;
use serde_json::{json, Value};
use sqlx::postgres::PgPool;
use std::collections::HashMap;
use tracing::error;

use crate::{
    models::{Ingredient, Recipe},
    todoist,
};

pub async fn get_ingredients(State(pool): State<PgPool>) -> Json<Value> {
    let ingredient_rows = sqlx::query_as!(
        Ingredient,
        "SELECT i.name AS name, l.name AS location
        FROM ingredient i
        INNER JOIN ingredient_location il ON i.id=il.ingredient_id
        INNER JOIN location l on l.id=il.location_id"
    )
    .fetch_all(&pool)
    .await
    .unwrap_or_else(|e| {
        error!("Could not query from database: {e}");
        vec![]
    });

    let mut ingredients_by_aisle = HashMap::new();
    for ingredient in &ingredient_rows {
        ingredients_by_aisle
            .entry(&ingredient.location)
            .or_insert_with(Vec::new)
            .push(&ingredient.name);
    }

    let recipe_rows = sqlx::query!(
        "SELECT r.name AS name, array_agg(i.name) as ingredients
        FROM recipe r
        INNER JOIN recipe_ingredient ri ON r.id=ri.recipe_id
        INNER JOIN ingredient i ON ri.ingredient_id=i.id
        GROUP BY r.name"
    )
    .fetch_all(&pool)
    .await
    .unwrap_or_else(|e| {
        error!("Could not query from database: {e}");
        vec![]
    });

    let mut recipes: Vec<Recipe> = Vec::new();
    for row in recipe_rows {
        recipes.push(Recipe {
            name: row.name,
            ingredients: row.ingredients.unwrap(),
        });
    }
    Json(json!(ingredients_by_aisle))
}

#[derive(serde::Deserialize)]
pub struct Input {
    ingredient: Vec<String>,
    sync: Option<String>,
}

pub async fn post_ingredients(State(pool): State<PgPool>, Form(input): Form<Input>) -> Json<Value> {
    let ingredients = input.ingredient;
    let sync = input.sync;

    let rows = sqlx::query_as!(
        Ingredient,
        "SELECT i.name AS name, l.name AS location
        FROM ingredient i
        INNER JOIN ingredient_location il ON (i.id=il.ingredient_id)
        INNER JOIN location l on (l.id=il.location_id)
        WHERE i.name = ANY($1)",
        &ingredients[..]
    )
    .fetch_all(&pool)
    .await
    .unwrap_or_else(|e| {
        error!("Could not query from database: {e}");
        vec![]
    });

    if sync.is_some() && !rows.is_empty() {
        todoist::sync_ingredients(&rows).await;
    }

    Json(json!(rows))
}

pub async fn get_recipes(State(pool): State<PgPool>) -> Json<Value> {
    let recipe_rows = sqlx::query!(
        "SELECT r.name AS name, array_agg(i.name) as ingredients
        FROM recipe r
        INNER JOIN recipe_ingredient ri ON r.id=ri.recipe_id
        INNER JOIN ingredient i ON ri.ingredient_id=i.id
        GROUP BY r.name"
    )
    .fetch_all(&pool)
    .await
    .unwrap_or_else(|e| {
        error!("Could not query from database: {e}");
        vec![]
    });

    let mut recipes: Vec<Recipe> = Vec::new();
    for row in recipe_rows {
        recipes.push(Recipe {
            name: row.name,
            ingredients: row.ingredients.unwrap(),
        });
    }

    Json(json!(recipes))
}
