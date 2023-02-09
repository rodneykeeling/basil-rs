use std::collections::HashMap;
use tracing::error;

use crate::models::Ingredient;

const TODOIST_API_TOKEN: &str = env!("TODOIST_API_TOKEN");
const TODOIST_API_URL: &str = "https://api.todoist.com/rest/v2/tasks";
const TODOIST_PROJECT_ID: &str = env!("TODOIST_PROJECT_ID");

pub async fn post_todist_ingredient(ingredient: &Ingredient) {
    let location = HashMap::from([
        ("bread", "112440056"),
        ("bulk", "112440118"),
        ("dairy", "112440095"),
        ("frozen", "112440090"),
        ("international", "112440073"),
        ("other", "112440160"),
        ("pasta", "112440051"),
        ("produce", "112440036"),
    ]);
    let ingredient_location = location[&ingredient.location[..]].to_string();

    let content = HashMap::from([
        ("content", &ingredient.name[..]),
        ("project_id", TODOIST_PROJECT_ID),
        ("section_id", &ingredient_location[..]),
    ]);

    let client = reqwest::Client::new();
    let _ = match client
        .post(TODOIST_API_URL)
        .json(&content)
        .header("Content-Type", "application/json")
        .header("Authorization", format!("Bearer {}", TODOIST_API_TOKEN))
        .send()
        .await
    {
        Ok(r) => r,
        Err(e) => {
            error!("Failed todoist request: {e}");
            return;
        }
    };
}
