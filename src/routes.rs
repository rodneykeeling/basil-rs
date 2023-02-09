use axum::{extract::State, Json};
use axum_extra::extract::Form;
use maud::{html, Markup};
use serde_json::{json, Value};
use sqlx::postgres::PgPool;
use tracing::error;

use crate::{models::Ingredient, todoist::post_todist_ingredient};

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
        form action="/" method="post" {
            @for row in &rows {
                input type="checkbox" name="ingredient" value=(row.name);
                label for="ingredient" { (row.name) };
                br;
            }
            br;
            input type="checkbox" name="sync" value="sync";
            label for="sync" { "Sync to Todoist" }
            br;
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

    if sync.is_some() {
        for ingredient in &rows {
            post_todist_ingredient(ingredient).await;
        }
    }

    Json(json!(rows))
}
