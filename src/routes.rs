use axum::{extract::State, Json};
use axum_extra::extract::Form;
use maud::{html, Markup};
use serde_json::{json, Value};
use sqlx::postgres::PgPool;
use tracing::error;

use crate::{
    models::{Ingredient, Recipe},
    todoist,
};

pub async fn get_ingredients(State(pool): State<PgPool>) -> Markup {
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
        error!("Could not query from database: {}", e);
        vec![]
    });

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
        error!("Could not query from database: {}", e);
        vec![]
    });

    let mut recipes: Vec<Recipe> = Vec::new();
    for row in &recipe_rows {
        let recipe_ingredients = row.ingredients.as_ref().unwrap().clone();
        recipes.push(Recipe {
            name: row.name.clone(),
            ingredients: recipe_ingredients,
        });
    }

    html! {
        form action="/" method="post" {
            @for recipe in &recipes {
                input type="checkbox" name="recipe" value=(recipe.name);
                label for="recipe" { (recipe.name) };
                br;
                @for ingredient in &recipe.ingredients {
                    "- " input type="checkbox" name="ingredient" value=(ingredient);
                    label for="ingredient" { (ingredient) };
                    br;
                }
                br;
            }
            br;
            @for row in &ingredient_rows {
                input type="checkbox" name="ingredient" value=(row.name);
                label for="ingredient" { (row.name) };
                br;
            }
            br;
            input type="checkbox" name="sync" value="sync";
            label for="sync" { "Sync to Todoist" }
            br; br;
            input type="submit" value="Submit";
        }
    }
}

#[derive(serde::Deserialize)]
pub struct Input {
    ingredient: Vec<String>,
    sync: Option<String>,
}

pub async fn get_unique_ingredients(
    State(pool): State<PgPool>,
    Form(input): Form<Input>,
) -> Json<Value> {
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
    .unwrap_or({
        error!("Could not query from database.");
        vec![]
    });

    if sync.is_some() {
        for ingredient in &rows {
            todoist::sync_ingredient(ingredient).await;
        }
    }

    Json(json!(rows))
}
