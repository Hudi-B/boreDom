import {BrowserRouter as Router, Link, Route, Routes } from 'react-router-dom';
import './App.css';
import Home from './Pages/Home';
import Login from './Pages/Login';
import Register from './Pages/Register';
import Community from './Pages/Community';
import MyPage from './Pages/MyPage';



function App() {
  return (
    <div>
      <Router>
        <nav className="navbar navbar-dark bg-dark">
            <ul className="navbar-nav mr-auto">
              <li className="nav-item active">
                {/*Icon goes here*/}
                <Link to={`/`} className="nav-link"> {/*bored bets text takes user home*/}
                  <h1>BoredBets</h1>
                </Link>
              </li>
              <li className="nav-item">
                <Link to={`/Community`} className="nav-link">
                  Community
                </Link>
              </li>
              <li className="nav-item">
                <Link to={`/register`} className="nav-link">
                  Login / Register
                </Link>
              </li>
              <li className="nav-item">
                <Link to={`/mypage`} className="nav-link">
                  UserHeadIcon
                </Link>
              </li>
            </ul>
        </nav>

        <Routes>
          <Route exact path="/" element={<Home/>} />
          <Route path="*" element={<Home/>} />

          <Route exact path="/community" element={<Community/>} />
          <Route exact path="login" element={<Login/>} />
          <Route exact path="register" element={<Register/>} />
          <Route exact path="mypage" element={<MyPage/>} />

        </Routes>
      </Router>
    </div>
  );
}

export default App;
