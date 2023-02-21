pub const ROOT_HTML: &str = r#"
<!doctype html>
<html lang="en">
<head>
  <title>Basil</title>
  <style>
  .aisle {
    float: left;
    margin: 3px;
    border-right: 1px solid #ddd;
    padding: 10px;
    height: 700px;
  }
  #submit {
    clear: both;
  }
  </style>
</head>
<body>
    <form action="/ingredients" method="post">
    {% for recipe in recipes %}
        <h3>Recipes</h3>
        <input type="checkbox" name="recipe" value="{{ recipe.name }}">
        <label for="recipe"><strong>{{ recipe.name }}</strong></label>
        <br>
        {% for ingredient in recipe.ingredients %}
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="ingredient" value="{{ ingredient }}">
            <label for="ingredient">{{ ingredient }}</label>
            <br>
        {% endfor %}
        <br>
    {% endfor %}
    <br>
    {% for (aisle, ingredients) in aisles|dictsort %}
        <div class="aisle">
            <h3>{{ aisle }} aisle</h3>
            {% for ingredient in ingredients %}
                <input type="checkbox" name="ingredient" value="{{ ingredient }}">
                <label for="ingredient">{{ ingredient }}</label>
                <br>
            {% endfor %}
        </div>
    {% endfor %}
    <br>
    <div id="submit">
        <input type="checkbox" name="sync" value="sync">
        <label for="sync">Sync to Todoist</label>
        <br><br>
        <input type="submit" value="Submit">
    </div>
</body>
</html>
"#;
