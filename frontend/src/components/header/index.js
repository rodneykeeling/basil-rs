import { Link } from 'preact-router/match';
import style from './style.css';

const Header = () => (
    <header class={style.header}>
        <a href="/" class={style.logo}>
            🌿
            <h1>Basil</h1>
        </a>
        <nav>
            <Link activeClassName={style.active} href="/">
                Home
            </Link>
        </nav>
    </header>
);

export default Header;
