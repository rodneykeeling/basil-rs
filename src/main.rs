use axum::{routing::get, Router};
use dotenvy::dotenv;
use std::net::SocketAddr;
use tracing::{error, info};

mod models;
mod routes;
mod sql;
mod templates;
mod todoist;

#[tokio::main]
async fn main() {
    dotenv().ok();
    tracing_subscriber::fmt::init();

    let db_pool = match sql::get_sql_conn().await {
        Err(e) => {
            error!("Could not connect to database: {e}");
            return;
        }
        Ok(conn) => conn,
    };

    let app = Router::new()
        .route("/", get(routes::root))
        .route(
            "/ingredients",
            get(routes::get_ingredients).post(routes::get_unique_ingredients),
        )
        .route("/recipes", get(routes::get_recipes))
        .with_state(db_pool);

    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    info!("Listening on {addr}");
    match axum::Server::bind(&addr)
        .serve(app.into_make_service())
        .await
    {
        Ok(a) => a,
        Err(e) => panic!("Could not start axum server: {e}"),
    };
}
