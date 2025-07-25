import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";
import Image from "../image";
import './user-account.css';
import UtilBible from "./util-bible-component";





const UserAccount = () => {

    return (
        <div id="foths-main">

           
            <FourElementHeader/>

            {/* Dynamic Component that receives user input to display in another element */}
            <div className="user-account-aside">
                <div className="utilities">Utilities</div>
                <div className="util-bible"><UtilBible/> </div>
                <div className="util-timer">
                    <div id="timer-container">
                        <span id="time-display">00:00:00</span> <br/>
                        <button id="start-button">Start</button>
                        <button id="pause-button">Pause</button>
                        <button id="reset-button">Reset</button>
                    </div>
                </div>
            </div>

            <div className="user-account-main">
                <div className="ua-title"> Account Dashboard </div>
                <div className="ua-query"> Query Selections</div>
                <div className="ua-display"> Display Window </div>

                <div className="fruits-grid">
                    <div className="fruit-cards-row-1">
                        <a href="./#/game-mode" id="fruit-card-1-hyperlink" className="fruit-card-1"><div className="responsive-fruit-card-text">Faith</div><Image/></a>
                    </div>
                </div>

            </div>
        
            {/* Flexbox stylization to create columns & column cards */}
            <div className="user-nav-css">
                <div className="user-info-column">Welcome, [User]!</div>
                
                <div className="user-info-card">
                <p className="user-info-title">User Information</p>
                    <div className="user-information">
                        <li className="user-field">Name</li>
                        <li className="user-field">Email</li>
                        <li className="user-field">Username</li>
                    </div>
                </div>
                <div className="user-scope-display">
                    <p className="usd-title">My Scope</p>
                    <div className="usd-window">
                        <p className="usd-timestamp">Timestamp</p>
                        <p className="usd-preset">Preset Goals</p>
                        <p className="usd-preset-subs">Preset Subgoals</p>
                        <p className="usd-custom">Custom Goals</p>
                        <p className="usd-custom-subs">Custom Subgoals</p>
                    </div>
                </div>
                <div className="user-recent-activity">
                    <p className="ura-title">Recent Activity</p>
                    <div className="ura-window">
                        <p className="ura1">  user.activity[i] - where [i] = (activityRecords.length - 1) </p>
                        <p className="ura2">Timestamp </p>
                        <p className="ura3">Score (if applicable) </p>
                    </div>
                </div>
            </div>

            <Footer/>

        </div>

    )
}

export default UserAccount;