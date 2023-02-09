use phf::phf_map;
use serde::Serialize;
use tracing::error;

use crate::models::Ingredient;

const TODOIST_API_TOKEN: &str = env!("TODOIST_API_TOKEN");
const TODOIST_API_URL: &str = "https://api.todoist.com/rest/v2/tasks";
const TODOIST_PROJECT_ID: &str = env!("TODOIST_PROJECT_ID");
const TODOIST_LOCATIONS: phf::Map<&'static str, &'static str> = phf_map! {
    "bread" => "112440056",
    "bulk" => "112440118",
    "dairy" => "112440095",
    "frozen" => "112440090",
    "international" => "112440073",
    "other" => "112440160",
    "pasta" => "112440051",
    "produce" => "112440036",
};

#[derive(Serialize)]
struct RequestContent<'a> {
    content: &'a str,
    project_id: &'a str,
    section_id: &'a str,
}

pub async fn sync_ingredient(ingredient: &Ingredient) {
    let ingredient_location = TODOIST_LOCATIONS[&ingredient.location[..]];

    let content = RequestContent {
        content: &ingredient.name[..],
        project_id: TODOIST_PROJECT_ID,
        section_id: ingredient_location,
    };

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
