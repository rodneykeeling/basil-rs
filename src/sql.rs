use sqlx::{postgres::PgPoolOptions, Pool, Postgres};
use std::time::Duration;

pub async fn get_sql_conn() -> Result<Pool<Postgres>, sqlx::Error> {
    let pool = PgPoolOptions::new()
        .acquire_timeout(Duration::from_secs(2))
        .max_connections(5)
        .connect(env!("DATABASE_URL"))
        .await?;
    Ok(pool)
}
