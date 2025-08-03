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
        const [mode, setMode] = useState(""); // Tracks the selected mode
        const [difficulty, setDifficulty] = useState(""); // Tracks the selected difficulty
        const [questions, setQuestions] = useState([]); // Stores questions fetched from the backend
        const [fruit, setFruit] = useState(""); // State to track the selected fruit
        const [errorMessage, setErrorMessage] = useState(""); // Tracks error messages

        const handleModeChange = (e) => {
            setMode(e.target.value);
        };
    
        // Event handler for difficulty selection
        const handleDifficultyChange = (e) => {
            setDifficulty(e.target.value);
        };

        const handleFruitChange = (e) => {
            setFruit(e.target.value);
        };
    
        // event handler functions that control the Previous & Next Arrows
        // also includes logic that disables Previous button on first slide & Next button on last slide
        // const handleClick = (index) => {
        //     if (index >= 0 && index < allScriptures.length) {
        //         setVal(index);
        //         setWordData(allScriptures[index]);
        //     }
        // };

        const handleSubmit = async () => {
            try {
                // Validate dropdown selections
                if (!fruit || fruit === "0" || !mode || mode === "0") {
                    setErrorMessage("Please select both FRUIT and MODE.");
                    return;
                }
    
                let url = "http://localhost:8080";
    
                // Determine the endpoint based on dropdown selections
                if (mode === "study" || mode === "recall") {
                    url += "/scriptures";
                } else if (mode === "quiz") {
                    url += "/questions";
                }
    
                // Add filters based on FRUIT and DIFFICULTY selections
                const params = new URLSearchParams();
                if (fruit !== "Every Fruit") {
                    params.append("fruit", fruit);
                }
                if (difficulty) {
                    params.append("difficulty", difficulty);
                }
    
                url += `?${params.toString()}`;
    
                const response = await fetch(url);
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
    
                const data = await response.json();
    
                // Process the response based on the MODE
                if (mode === "study" || mode === "recall") {
                    const scriptures = data.map(scripture => new Scriptures(scripture.id, scripture.verse, scripture.scripture));
                    setAllScriptures(scriptures);
                    setWordData(scriptures[0]); // Display the first scripture
                } else if (mode === "quiz") {
                    setQuestions(data);
                    setWordData(data[0]); // Display the first question
                }
                setErrorMessage(""); // Clear any previous error messages
            } catch (error) {
                // console.error("Error fetching data:", error);
                setErrorMessage("Failed to fetch data. Please try again.");
            }
        };
    
        // Navigate to the next scripture
        const handleNext = () => {
            const nextIndex = val < (mode === "quiz" ? questions.length : allScriptures.length) - 1 ? val + 1 : val;
            setVal(nextIndex);
            setWordData(mode === "quiz" ? questions[nextIndex] : allScriptures[nextIndex]);
        };
    
        // Navigate to the previous scripture
        const handlePrevious = () => {
            const prevIndex = val > 0 ? val - 1 : val;
            setVal(prevIndex);
            setWordData(mode === "quiz" ? questions[prevIndex] : allScriptures[prevIndex]);
        };
    
      // Fetch scriptures and questions based on mode and difficulty
        // useEffect(() => {
        //     const fetchData = async () => {
        //         try {
        //             let url = "http://localhost:8080/";
        //             if (mode === "study" || mode === "recall") {
        //                 url += `scriptures?difficulty=${difficulty}`;
        //             } else if (mode === "quiz") {
        //                 url += `questions?difficulty=${difficulty}`;
        //             }

        //             const response = await fetch(url);
        //             const data = await response.json();
        //             console.log("Fetched data:", data);
        //             if (mode === "study" || mode === "recall") {
        //                 const scriptures = data.map(scripture => new Scriptures(scripture.id, scripture.verse, scripture.scripture));
        //                 setAllScriptures(scriptures);
        //                 setWordData(scriptures[0]); // Display the first scripture
        //             } else if (mode === "quiz") {
        //                 setQuestions(data);
        //                 setWordData(data[0]); // Display the first question
        //             }
        //         } catch (error) {
        //             console.error("Error fetching data:", error);
        //         }
        //     };

        //     if (mode && difficulty) {
        //         fetchData();
        //     }
        // }, [mode, difficulty]);

    // const fetchScripture = async () => {
    //         try {
    //             const response = await fetch('http://localhost:8080/scriptures');
    //             const data = await response.json();
    //             console.log('Scripture data fetched successfully:', data);
    
    //             // Map the fetched data into the desired format
    //             const scriptures = data.map(scripture => new Scriptures(scripture.id, scripture.verse, scripture.scripture));
    //             setAllScriptures(scriptures);
    
    //             // Set the initial scripture to display
    //             if (scriptures.length > 0) {
    //                 setWordData(scriptures[0]);
    //             }
    //         } catch (error) {
    //             console.error('Error fetching scripture:', error);
    //         }
    //     };

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
                    <h2> {wordData ? ( <p>{mode === "quiz" ? wordData.questions : wordData.scripture}</p> ) : ( <p>Make a Selection!</p>)} </h2> 
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
                    <select id="goals" value={fruit} className="ua-study-select" onChange={handleFruitChange}>
                        <option value="0">FRUIT</option>
                        <option value="Every Fruit">Every Fruit</option>
                        <option value="Faith">Faith</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <select id="goals" className="ua-study-select" value={mode} onChange={handleModeChange}>
                        <option value="0">MODE</option>
                        <option value="study">Study</option>
                        <option value="recall">Recall</option>
                        <option value="quiz">Quiz</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <select id="goals" className="ua-study-select" value={difficulty} onChange={handleDifficultyChange}>
                        <option value="0">DIFFICULTY</option>
                        <option value="easy">Easy</option>
                        <option value="intermediate">Intermediate</option>
                        <option value="difficult">Difficult</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <button type="submit" className="ua-fetch-button" onClick={handleSubmit}>Submit</button> <br /> <br />
                    {errorMessage && <p style={{ color: "white" }}>{errorMessage}</p>}
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