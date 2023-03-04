import { useState, useEffect } from 'preact/hooks';
import style from './style.css';


const Home = () => {
    const [ingredients, setIngredients] = useState({});

    useEffect(() => {
        const fetchData = async () => {
            try {
                const resp = await fetch("http://localhost:3000/ingredients");
                const json = await resp.json();
                setIngredients(json);
            } catch (error) {
                console.log(error);
            }
        };
        fetchData();
    }, []);

    return (
        <div>
            <h1>Ingredients</h1>
            <form action="http://localhost:3000/ingredients" method="post">
                <div>
                    {
                        Object.entries(ingredients).sort().map(([key, value]) => {
                            return (
                                <div class={style.aisle}>
                                    <h3>{key}</h3>
                                    {value.map(ingredient => <Ingredient name={ingredient} />)}
                                </div>
                            )
                        })
                    }
                </div>
                <div id="submit">
                    <input type="checkbox" name="sync" value="sync" />
                    <label for="sync">Sync to Todoist</label>
                    <br /><br />
                    <input type="submit" value="Submit" />
                </div>
            </form>
        </div>
    );
};

function Ingredient(props) {
    return (
        <div>
            <input type="checkbox" name="ingredient" id={props.name} value={props.name} />
            <label for={props.name}>{props.name}</label>
            <br />
        </div>
    );
};

export default Home;
