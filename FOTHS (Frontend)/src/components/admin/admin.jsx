import Footer from "../footer/footer";
import './admin.css';
import UserFetch from "./user-fetch";
import ScriptureFetch from "./scripture-fetch";
import QuestionFetch from "./question-fetch";
import AdminQuery from "./query";
import Pomodoro from "../user-accounts/pomodoro/pomodoro";
import Music from "./music";
import AdminHeader from "../header-components/admin-header";
import FourElementHeader from "../header-components/header-4";





const Admin = () => {

    return (
        <div id="foths-main">

           
            <AdminHeader/>
            {/* <FourElementHeader/> */}

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

            </div>
        
            {/* Flexbox stylization to create columns & column cards */}
            <div className="user-nav-css">
                <div className="user-info-column">Query Details</div>
                
                <div className="user-info-card">
                <p className="user-info-title">Name/Verse/Question</p>
                    <div className="user-information">
                        <li className="user-field">Name</li>
                        <li className="user-field">Email</li>
                        <li className="user-field">Username</li>
                    </div>
                </div>
                <div className="user-scope-display">
                    <p className="usd-title">Email/Scripture/Answer</p>
                    <div className="usd-window">
                        <p className="usd-timestamp">Timestamp</p>
                        <p className="usd-preset">Preset Goals</p>
                        <p className="usd-preset-subs">Preset Subgoals</p>
                        <p className="usd-custom">Custom Goals</p>
                        <p className="usd-custom-subs">Custom Subgoals</p>
                    </div>
                </div>
                <div className="user-recent-activity">
                    <p className="ura-title">Other</p>
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

export default Admin;