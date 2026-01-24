// LIVE URL: https://foths-frontend-production.up.railway.app/

import './App.css';
import './components/accounts/UserAccount.css'
import { Routes, Route, HashRouter } from 'react-router-dom';
import { useState, useEffect } from 'react';
import { Navigate } from 'react-router-dom';
import StartFoths from './components/Miscellaneous/StartFoths';
import Dashboard from './components/Miscellaneous/Dashboard';
import FOTHSMain from './components/foths/FOTHSMain';
import GameMode from './components/foths/GameMode';
import Recall from './components/recall/Recall';
import Multichoice from './components/multichoice/Multichoice';
import About from './components/footer/about';
import LoginForm from './components/Miscellaneous/LI/SU/LoginForm';
import Fetch from './components/fetch/Fetch'; 
import Admin from './components/admin/Admin';
import UserLogin from './components/Miscellaneous/LI/SU/UserLogin';
import UserRegistration from './components/Miscellaneous/LI/SU/UserRegistration';
import Registration from './components/Miscellaneous/LI/SU/Registration';
import UserAccount from './components/accounts/UserAccount';
import Study from './components/foths/study';

// I HOPE THIS DEPLOYMENT WORKS...EVERYTHING IS CORRECT!!!!

// All of my main components are plugged into the App component
// Each route has a specific parameter ID

// All routes are enveloped inside Routes & HashRouter tags for proper functionality
function App() {
  const [authenticated, setAuthenticated] = useState(null);

  useEffect(() => {
    // Check session on app load / refresh
    fetch("/users/me", { credentials: "include" })
      .then(res => setAuthenticated(res.ok))
      .catch(() => setAuthenticated(false));
  }, []);

  if (authenticated === null) return null; // optional: show spinner while checking

  return (
    <>
    <HashRouter>
      <Routes>

        {/* PUBLIC ROUTES */}
        <Route index path="/" element={<LoginForm />} />
        <Route path="/user-login" element={<UserLogin />} />
        <Route path="/user-registration" element={<UserRegistration />} />
        <Route path="/registration" element={<Registration />} />

        {/* PROTECTED ROUTES */}
        <Route path="/start" element={<StartFoths />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/foths" element={<FOTHSMain />} />
        <Route path="/game-mode" element={<GameMode />} />
        <Route path="/study" element={<Study />} />
        <Route path="/recall" element={<Recall />} />
        <Route path="/multichoice" element={<Multichoice />} />
        <Route path="/about" element={<About />} />
        <Route path="/fetch" element={<Fetch />} />
        <Route path="/admin" element={<Admin />} />
        <Route path="/user-account" element={<UserAccount />} />

        {/* CATCH ALL */}
        <Route path="*" element={<Navigate to={authenticated ? "/dashboard" : "/"} replace />} />
      </Routes>
    </HashRouter>
    </>
  );
}

export default App;
