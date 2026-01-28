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
import UserRegistration from './components/Miscellaneous/LI/SU/UserRegistration';
import Registration from './components/Miscellaneous/LI/SU/Registration';
import UserAccount from './components/accounts/UserAccount';
import Study from './components/foths/study';
import { UserProvider } from './components/Miscellaneous/UserContext';

// I HOPE THIS DEPLOYMENT WORKS...EVERYTHING IS CORRECT!!!!

// All of my main components are plugged into the App component
// Each route has a specific parameter ID

// All routes are enveloped inside Routes & HashRouter tags for proper functionality
function App() {
  const [authenticated, setAuthenticated] = useState(null);
  const [isAuthenticated, setIsAuthenticated] = useState(false);


  useEffect(() => {
    // Check session on app load / refresh
    fetch("/users/me", { credentials: "include" })
      .then(res => setAuthenticated(res.ok))
      .catch(() => setAuthenticated(false));
  }, []);

  if (authenticated === null) return null; // optional: show spinner while checking

  return (
    <>
    <UserProvider>
      <HashRouter>
        <Routes>

          {/* PUBLIC ROUTES */}
          <Route index path="/" element={<LoginForm setIsAuthenticated={setIsAuthenticated} />} />

          {/* PROTECTED ROUTES */}
          <Route path="/start" element={isAuthenticated ? <StartFoths /> : <Navigate to="/" />} />
          <Route path="/dashboard" element={isAuthenticated ? <Dashboard /> : <Navigate to="/" />} />
          <Route path="/foths" element={isAuthenticated ? <FOTHSMain /> : <Navigate to="/" />} />
          <Route path="/game-mode" element={isAuthenticated ? <GameMode /> : <Navigate to="/" />} />
          <Route path="/study" element={isAuthenticated ? <Study /> : <Navigate to="/" />} />
          <Route path="/recall" element={isAuthenticated ? <Recall /> : <Navigate to="/" />} />
          <Route path="/multichoice" element={isAuthenticated ? <Multichoice /> : <Navigate to="/" />} />
          <Route path="/about" element={isAuthenticated ? <About /> : <Navigate to="/" />} />
          <Route path="/fetch" element={isAuthenticated ? <Fetch /> : <Navigate to="/" />} />
          <Route path="/admin" element={isAuthenticated ? <Admin /> : <Navigate to="/" />} />
          <Route path="/user-account" element={isAuthenticated ? <UserAccount /> : <Navigate to="/" />} />
          <Route path="/user-registration" element={isAuthenticated ? <UserRegistration /> : <Navigate to="/" />} />
          <Route path="/registration" element={isAuthenticated ? <Registration /> : <Navigate to="/" />} />

          {/* CATCH ALL */}
          <Route path="*" element={<Navigate to="/" />} />

        </Routes>
      </HashRouter>
    </UserProvider>
    </>
  );
}

export default App;
