use axum::{routing::get, Router};
use dotenvy::dotenv;
use std::net::SocketAddr;
use tracing::info;

mod handlers;
mod models;
mod sql;
mod todoist;

#[tokio::main]
async fn main() {
    dotenv().ok();
    tracing_subscriber::fmt::init();

    let db_pool = sql::get_sql_conn()
        .await
        .expect("Could not connect to database: {err}");

    let app = Router::new()
        .route(
            "/ingredients",
            get(handlers::get_ingredients).post(handlers::post_ingredients),
        )
        .route("/recipes", get(handlers::get_recipes))
        .with_state(db_pool);

    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    info!("Listening on {addr}");
    axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
        .expect("Could not start axum server: {err}");
}
