use axum::{extract::State, Json};
use axum_extra::extract::Form;
use maud::{html, Markup};
use serde_json::{json, Value};
use sqlx::postgres::PgPool;
use tracing::error;

use crate::{models::Ingredient, todoist::post_todist_ingredient};

pub async fn root() -> Json<Value> {
    Json(json!({"hello": "world!"}))
}

pub async fn get_ingredients(State(pool): State<PgPool>) -> Markup {
    let rows = match sqlx::query_as!(
        Ingredient,
        "SELECT i.name AS name, l.name AS location
        FROM ingredient i
        INNER JOIN ingredient_location il ON (i.id=il.ingredient_id)
        INNER JOIN location l on (l.id=il.location_id)"
    )
    .fetch_all(&pool)
    .await
    {
        Err(e) => {
            error!("Could not query from database: {e}");
            vec![]
        }
        Ok(rows) => rows,
    };

    html! {
        form action="/ingredients" method="post" {
            @for row in &rows {
                label for="ingredient";
                input type="checkbox" name="ingredient" value=(row.name);
                (row.name)
                br;
            }
            button type="submit" value="Submit";
        }
    }
}

#[derive(serde::Deserialize)]
pub struct Input {
    ingredient: Vec<String>,
}

pub async fn get_unique_ingredients(
    State(pool): State<PgPool>,
    Form(input): Form<Input>,
) -> Json<Value> {
    let ingredients = input.ingredient;

    let rows = match sqlx::query_as!(
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
    {
        Err(e) => {
            error!("Could not query from database: {e}");
            vec![]
        }
        Ok(rows) => rows,
    };

    for ingredient in &rows {
        post_todist_ingredient(ingredient).await;
    }

    Json(json!(rows))
}
