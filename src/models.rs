use serde::Serialize;

#[derive(Serialize)]
pub struct Recipe {
    pub id: i32,
    pub name: String,
    pub ingredients: Vec<Ingredient>,
}

#[derive(Serialize)]
pub struct Ingredient {
    pub name: String,
    pub location: String,
}
