import { Link } from 'preact-router/match';
import style from './style.css';

const Header = () => (
    <header class={style.header}>
        <a href="/" class={style.logo}>🌿<h1>basil</h1></a>
    </header>
);

export default Header;
