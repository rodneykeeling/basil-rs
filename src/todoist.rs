use std::collections::HashMap;
use tracing::error;

use crate::models::Ingredient;

pub async fn post_todist_ingredient(ingredient: &Ingredient) {
    let todoist_api_url = "https://api.todoist.com/rest/v2/tasks".to_string();
    let todoist_project_id = env!("TODOIST_PROJECT_ID").to_string();

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

    let todoist_api_token = env!("TODOIST_API_TOKEN");

    let client = reqwest::Client::new();
    let content = HashMap::from([
        ("content", &ingredient.name),
        ("project_id", &todoist_project_id),
        ("section_id", &ingredient_location),
    ]);
    let _ = match client
        .post(todoist_api_url)
        .json(&content)
        .header("Content-Type", "application/json")
        .header("Authorization", format!("Bearer {todoist_api_token}"))
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
