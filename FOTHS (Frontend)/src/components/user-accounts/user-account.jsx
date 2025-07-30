// User Account Component

import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";
import './user-account.css';
import './pomodoro/pomodoro.css';
import UtilBible from "./util-bible-component";
import Pomodoro from "./pomodoro/pomodoro";


const UserAccount = () => {

    return (
        <div id="foths-main">

           
            <FourElementHeader/>

            {/* Dynamic Component that receives user input to display in another element */}
            <div className="user-account-aside">
                <div className="utilities">Utilities</div>
                <div className="util-bible"><UtilBible/> </div>
                <div className="util-timer"><Pomodoro/></div>
                <div id="app"></div>
            </div>

            <div className="foths-main">
                <div className="foths-main-title"> Account Dashboard </div>

                <main className="ua-study-window"> <p> Verse </p> </main>
                <main id='ua-window' className="ua-study-window"> <p> Display Window: Scriptures & Verses  </p> </main>

                <main className="ua-fetch-window"> 
                    <label className="ua-fetch-labels">Fruit</label>
                    <select id="goals" value="user-fetch"  className="goal-select"  >
                        <option value="0"></option>
                        <option value="1">Every Fruit</option>
                        <option value="1">Faith</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <label className="ua-fetch-labels">Mode</label>
                    <select id="goals" value="user-fetch"  className="goal-select"  >
                        <option value="0"></option>
                        <option value="1">Study</option>
                        <option value="2">Recall</option>
                        <option value="3">Quiz</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <label className="ua-fetch-labels">Difficulty</label>
                    <select id="goals" value="user-fetch"  className="goal-select"  >
                        <option value="0"></option>
                        <option value="1">Easy</option>
                        <option value="2">Intermediate</option>
                        <option value="3">Difficult</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                </main>

            </div>
        
            {/* Flexbox stylization to create columns & column cards */}
            <div className="user-nav-css">
                <div className="user-info-column">USER FULL NAME</div>
                
                <div className="user-info-card">
                <p className="user-info-title">User Information</p>
                    <div className="user-information">
                        <li className="user-field">Joshua White</li>
                        <li className="user-field">jwhite@gmail.com</li>
                        <li className="user-field">jwhitad15</li>
                    </div>
                </div>
                <div className="user-scope-display">
                    <p className="usd-title">My Scope</p>
                    <div className="usd-window">
                        <p id='window-text' className="usd-timestamp">August 1, 2025 - 12:31:30 PM</p>
                        <p id='window-text' className="usd-preset">Read 1 Chapter a Day</p>
                        <p id='window-text' className="usd-preset-subs">Duration: 1 week</p>
                        <p id='window-text' className="usd-custom">Start: John 14</p>
                        <p id='window-text' className="usd-custom-subs">End: John 20</p>
                    </div>
                </div>
                <div className="user-recent-activity">
                    <p className="ura-title">Recent Activity</p>
                    <div className="ura-window">
                        <p id='window-text' className="ura1">  user.activity[i] - where [i] = (activityRecords.length - 1) </p>
                        <p id='window-text' className="ura2">Timestamp </p>
                        <p id='window-text' className="ura3">Score (if applicable) </p>
                    </div>
                </div>
            </div>

            <Footer/>

        </div>

    )
}

export default UserAccount;