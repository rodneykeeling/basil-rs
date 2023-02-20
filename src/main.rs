use axum::{routing::get, Router};
use dotenvy::dotenv;
use std::net::SocketAddr;
use tracing::{error, info};

mod handlers;
mod models;
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
        .route("/", get(handlers::root))
        .route(
            "/ingredients",
            get(handlers::get_all_ingredients).post(handlers::get_ingredients),
        )
        .route("/recipes", get(handlers::get_recipes))
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
