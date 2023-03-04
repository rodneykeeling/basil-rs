import { Router } from 'preact-router';

import Header from './header';

// Code-splitting is automated for `routes` directory
import Home from '../routes/home';

const App = () => (
    <div id="app">
        <Header />
        <main>
            <Router>
                <Home path="/" />
            </Router>
        </main>
    </div>
);

export default App;
