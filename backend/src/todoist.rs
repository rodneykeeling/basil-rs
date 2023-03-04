use phf::phf_map;
use serde::Serialize;
use std::collections::HashMap;
use tracing::error;
use uuid::Uuid;

use crate::models::Ingredient;

const TODOIST_API_TOKEN: &str = env!("TODOIST_API_TOKEN");
const TODOIST_API_URL: &str = "https://api.todoist.com/sync/v9/sync";
const TODOIST_PROJECT_ID: &str = env!("TODOIST_PROJECT_ID");
// Hacky mapping from aisle name to Todoist section ID, defined to prevent unnecessary API calls to
// Todoist since this data is static.
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

#[derive(Debug, Serialize)]
struct RequestContent<'a> {
    content: &'a str,
    project_id: &'a str,
    section_id: &'a str,
}

#[derive(Debug, Serialize)]
struct Command<'a> {
    r#type: &'a str,
    temp_id: Uuid,
    uuid: Uuid,
    args: RequestContent<'a>,
}

pub async fn sync_ingredients(ingredients: &Vec<Ingredient>) {
    let mut commands_map = HashMap::new();
    let mut commands = Vec::new();

    for ingredient in ingredients {
        let ingredient_location = TODOIST_LOCATIONS[&ingredient.location[..]];
        commands.push(Command {
            r#type: "item_add",
            temp_id: Uuid::new_v4(),
            uuid: Uuid::new_v4(),
            args: RequestContent {
                content: &ingredient.name,
                project_id: TODOIST_PROJECT_ID,
                section_id: ingredient_location,
            },
        });
    }

    commands_map.insert("commands", commands);

    let client = reqwest::Client::new();
    let _ = match client
        .post(TODOIST_API_URL)
        .json(&commands_map)
        .header("Authorization", format!("Bearer {TODOIST_API_TOKEN}"))
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
