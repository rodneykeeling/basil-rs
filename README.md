# 🌿 basil.rs

`basil` is a personal project to help me grocery shop and learn Rust. It can generate grocery lists based on most frequently purchased ingredients, as well as ingredients from my favorite recipes, and syncs it to my grocery list on Todoist, all grouped by aisle.

Note: this is a tool I use every time I go grocery shopping, but it's also a side-project for my own learning purposes, so over-engineering is expected here.

## Features
- [x] List of all ingredients for one-off selection
- [x] List of all ingredients for any given recipe
- [ ] Determine amount of ingredients to get (`onion x3`) based on recipe/ingredient selections
- [x] Final grocery list grouped by aisle
- [x] Todoist sync
- [x] A better frontend experience in place of Rust-based templating
- [ ] Ordering: alphabetically, chronologically (most-recently purchased), hierarchically (aisle)
- [ ] Dockerize Rust and Preact apps?

## Usage
- `cp env-example .env` and fill in the relevant TODOIST API values
- `docker compose up` to get PostgreSQL running
- `psql -h localhost -d basil -U root -f dump.sql` to import data
- `cd backend && cargo run` to get the API running
- `cd frontend && npm run dev` and visit `localhost:8080`
