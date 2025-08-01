import './App.css'
import './components/user-accounts/user-account.css'
import {Routes, Route, HashRouter } from 'react-router-dom'
import Dashboard from './components/Miscellaneous/dashboard';
import FOTHSMain from './components/foths/foths-main-page';
import GameMode from './components/foths/game-mode';
import About from './components/footer/about';
import Study from './components/foths/study';
import Fetch from './components/fetch-folder/fetch';
import StartFoths from './components/Miscellaneous/start-foths';
import LoginForm from './components/Miscellaneous/LI/SU/login-form';
import Multichoice from './components/multichoice/multichoice';
import Recall from './components/recall/recall';
import UserLogin from './components/Miscellaneous/LI/SU/user-login';
import UserRegistration from './components/Miscellaneous/LI/SU/user-registration';
import Registration from './components/Miscellaneous/LI/SU/registration';
import UserAccount from './components/user-accounts/user-account';
import Admin from './components/admin/admin';

// All of my main components are plugged into the App component
// Each route has a specific parameter ID
// All routes are enveloped inside Routes & HashRouter tags for proper functionality
function App() {


  return (
    <>
      <HashRouter>
        <Routes>
          <Route index path="/" element={ <StartFoths/>} />
          <Route path="/dashboard" element={ <Dashboard/>} />
          <Route path="/foths" element={ <FOTHSMain/>} />
          <Route path="/game-mode" element={ <GameMode/>} />
          <Route path="/study" element={ <Study/>} />
          <Route path="/recall" element={ <Recall/>} />
          <Route path="/multichoice" element={ <Multichoice/>} />
          <Route path="/about" element={ <About/>} />
          <Route path="/login" element={ <LoginForm/>}/>
          <Route path="/fetch" element={ <Fetch/>} />
          <Route path="/admin" element={ <Admin/>} />
          <Route path="/user-login" element={ <UserLogin/>} />
          <Route path="/user-registration" element={ <UserRegistration/>} />
          <Route path="/registration" element={ <Registration/>} />
          <Route path="/user-account" element={ <UserAccount/>} />
        </Routes>
      </HashRouter>
    </>
  )
}

export default App;
