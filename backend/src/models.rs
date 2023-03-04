use serde::Serialize;

#[derive(Serialize)]
pub struct Recipe {
    pub name: String,
    pub ingredients: Vec<String>,
}

#[derive(Serialize)]
pub struct Ingredient {
    pub name: String,
    pub location: String,
}
