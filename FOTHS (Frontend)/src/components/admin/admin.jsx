import Footer from "../footer/footer";
import './admin.css';
import UserFetch from "./user-fetch";
import ScriptureFetch from "./scripture-fetch";
import QuestionFetch from "./question-fetch";
import AdminQuery from "./query";
import Music from "./music";
import AdminHeader from "../header-components/admin-header";





const Admin = () => {

    return (
        <div id="foths-main">

           
            <AdminHeader/>

            {/* Dynamic Component that receives user input to display in another element */}
            <div className="user-account-aside">
                <div className="utilities">Database Query</div>
                <div className="util-bible"><AdminQuery/> </div>
                <div className="util-timer"><Music/></div>
                <div id="app"></div>
            </div>

            <div className="foths-main">
                <div className="foths-main-title"> Administrative Dashboard </div>
                <UserFetch/>
                <ScriptureFetch/>
                <QuestionFetch/>
                <main className="ua-study-window"> <p> Main Window  </p> </main>
                <main id='ua-window' className="ua-study-window"> <p> Display Window: USERS, QUESTIONS, SCRIPTURE  </p> </main>

            </div>
        
            {/* Flexbox stylization to create columns & column cards */}
            <div className="user-nav-css">
                <div className="user-info-column">Query Details</div>
                
                <div className="user-info-card">
                <p className="user-info-title">Name | Verse | Question</p>
                    <div className="user-information">
                        <li className="user-field">NAME: Joshua White</li>
                        <li className="user-field">EMAIL: jwhite@gmail.com</li>
                        <li className="user-field">USER: jwhitad15</li>
                    </div>
                </div>
                <div className="user-scope-display">
                    <p className="usd-title">Email | Scripture | Answer</p>
                    <div className="usd-window">
                        <p id='window-text' className="usd-timestamp">jwhite@gmail.com</p>
                        <p id='window-text' className="usd-preset">"Knowing this, that the trying of your faith works patience...But let him ask in faith, nothing wavering. For he that wavers is like a wave of the sea driven with the wind and tossed."</p>
                        <p id='window-text' className="usd-preset-subs">James 1:3 & 6</p>
                    </div>
                </div>
                <div className="user-recent-activity">
                    <p className="ura-title">Other</p>
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

export default Admin;