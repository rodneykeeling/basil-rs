use axum::{extract::State, routing::get, Json, Router};
use axum_extra::extract::Form;
use dotenvy::dotenv;
use maud::{html, Markup};
use serde::Serialize;
use serde_json::{json, Value};
use sqlx::{
    postgres::{PgPool, PgPoolOptions},
    Pool, Postgres,
};
use std::{net::SocketAddr, time::Duration};
use tracing::{error, info};

#[tokio::main]
async fn main() {
    dotenv().ok();
    tracing_subscriber::fmt::init();

    let db_pool = match get_sql_conn().await {
        Err(e) => {
            error!("Could not connect to database: {e}");
            return;
        }
        Ok(conn) => conn,
    };

    let app = Router::new()
        .route("/", get(root))
        .route(
            "/ingredients",
            get(get_ingredients).post(get_unique_ingredients),
        )
        .with_state(db_pool);

    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    info!("Listening on {addr}");
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}

async fn root() -> Json<Value> {
    Json(json!({"hello": "world!"}))
}

async fn get_ingredients(State(pool): State<PgPool>) -> Markup {
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
struct Input {
    ingredient: Vec<String>,
}

async fn get_unique_ingredients(
    State(pool): State<PgPool>,
    Form(input): Form<Input>,
) -> Json<Value> {
    dbg!(&input.ingredient);
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

    Json(json!(rows))
}

async fn get_sql_conn() -> Result<Pool<Postgres>, sqlx::Error> {
    let pool = PgPoolOptions::new()
        .acquire_timeout(Duration::from_secs(2))
        .max_connections(5)
        .connect(env!("DATABASE_URL"))
        .await?;
    Ok(pool)
}

#[derive(Serialize)]
struct Recipe {
    id: i32,
    name: String,
}

#[derive(Serialize)]
struct Ingredient {
    name: String,
    location: String,
}
