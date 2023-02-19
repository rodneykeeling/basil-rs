pub const ROOT_HTML: &str = r#"
<!doctype html>
<html lang="en">
<head>
  <title>Basil</title>
</head>
<body>
    <form action="/ingredients" method="post">
    {% for recipe in recipes %}
        <input type="checkbox" name="recipe" value={{ recipe.name }}>
        <label for="recipe">{{ recipe.name }}</label>
        <br>
        {% for ingredient in recipe.ingredients %}
            &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="ingredient" value={{ ingredient }}>
            <label for="ingredient">{{ ingredient }}</label>
            <br>
        {% endfor %}
        <br>
    {% endfor %}
    <br>
    {% for row in ingredients %}
        <input type="checkbox" name="ingredient" value={{ row.name }}>
        <label for="ingredient">{{ row.name }}</label>
        <br>
    {% endfor %}
    <br>
    <input type="checkbox" name="sync" value="sync">
    <label for="sync">Sync to Todoist</label>
    <br><br>
    <input type="submit" value="Submit">
</body>
</html>
"#;
