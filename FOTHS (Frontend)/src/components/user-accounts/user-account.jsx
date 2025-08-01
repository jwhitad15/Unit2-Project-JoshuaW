// User Account Component

import React, { useState, useEffect } from "react";
import FourElementHeader from "../header-components/header-4";
import { FaArrowRightLong, FaArrowLeftLong } from "react-icons/fa6";
import Footer from "../footer/footer";
import './user-account.css';
import './pomodoro/pomodoro.css';
import UtilBible from "./util-bible-component";
import Pomodoro from "./pomodoro/pomodoro";
import Scriptures from "../../classes/scriptures";
import '../recall/recall.css';


const UserAccount = () => {

        const [wordData, setWordData] = useState(null)
        const [val, setVal] = useState(0)
        const [allScriptures, setAllScriptures] = useState([]);
    
        // event handler functions that control the Previous & Next Arrows
        // also includes logic that disables Previous button on first slide & Next button on last slide
        const handleClick = (index) => {
            if (index >= 0 && index < allScriptures.length) {
                setVal(index);
                setWordData(allScriptures[index]);
            }
        };
    
        // Navigate to the next scripture
        const handleNext = () => {
            const nextIndex = val < allScriptures.length - 1 ? val + 1 : val;
            setVal(nextIndex);
            setWordData(allScriptures[nextIndex]);
        };
    
        // Navigate to the previous scripture
        const handlePrevious = () => {
            const prevIndex = val > 0 ? val - 1 : val;
            setVal(prevIndex);
            setWordData(allScriptures[prevIndex]);
        };
    
        useEffect(() => {
            fetchScripture();
        }, []);

    const fetchScripture = async () => {
            try {
                const response = await fetch('http://localhost:8080/scriptures');
                const data = await response.json();
                console.log('Scripture data fetched successfully:', data);
    
                // Map the fetched data into the desired format
                const scriptures = data.map(scripture => new Scriptures(scripture.id, scripture.verse, scripture.scripture));
                setAllScriptures(scriptures);
    
                // Set the initial scripture to display
                if (scriptures.length > 0) {
                    setWordData(scriptures[0]);
                }
            } catch (error) {
                console.error('Error fetching scripture:', error);
            }
        };

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
                <main id='ua-window' className="ua-study-window"> 
                    <h2> {wordData ? ( <p>{wordData.scripture}</p> ) : ( <p>No scriptures available</p>)} </h2> 
                    <div>
                        <button onClick={handleNext} className="ua-next-button"> 
                            <div id="study-button-text"> Next </div>
                            <div id="study-button-icon"> <FaArrowRightLong/> </div>
                        </button>
                    </div>
        
                    {/* event handling inserted on buttons */}
                    <div>
                        <button onClick={handlePrevious} className="ua-previous-button">
                            <div id="study-button-text"> Previous </div>  
                            <div id="study-button-icon"> <FaArrowLeftLong/> </div>  
                        </button>
                    </div>
                </main>

                <main className="ua-fetch-window"> 
                    <select id="goals" value="user-fetch"  className="ua-study-select"  >
                        <option value="0">FRUIT</option>
                        <option value="1">Every Fruit</option>
                        <option value="1">Faith</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <select id="goals" value="user-fetch"  className="ua-study-select"  >
                        <option value="0">MODE</option>
                        <option value="1">Study</option>
                        <option value="2">Recall</option>
                        <option value="3">Quiz</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <select id="goals" value="user-fetch"  className="ua-study-select"  >
                        <option value="0">DIFFICULTY</option>
                        <option value="1">Easy</option>
                        <option value="2">Intermediate</option>
                        <option value="3">Difficult</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <button type="submit" className="ua-fetch-button" >Submit</button>  <br/>  <br/>
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