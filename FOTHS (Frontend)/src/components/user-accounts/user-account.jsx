// User Account Component

import React, { useState, useEffect } from "react";
import { FaArrowRightLong, FaArrowLeftLong } from "react-icons/fa6";
import './user-account.css';
import './pomodoro/pomodoro.css';
import UtilBible from "./util-bible-component";
import Pomodoro from "./pomodoro/pomodoro";
import Scriptures from "../../classes/scriptures";
import '../recall/recall.css';
import AdminHeader from "../header-components/admin-header";
import AccountFooter from "../footer/account-footer";


const UserAccount = () => {

        const [wordData, setWordData] = useState(null)
        const [allScriptures, setAllScriptures] = useState([]);
        const [selectedMode, setSelectedMode] = useState(""); // Tracks the selected mode
        const [selectedDifficulty, setSelectedDifficulty] = useState(""); // Tracks the selected difficulty
        const [questions, setQuestions] = useState([]); // Stores questions fetched from the backend
        const [selectedFruit, setSelectedFruit] = useState(""); // State to track the selected fruit
        const [displayMode, setDisplayMode] = useState(""); // Controls the table rendering
        const [errorMessage, setErrorMessage] = useState(""); // Tracks error messages
        const [currentTimestamp, setCurrentTimestamp] = useState("");

        // Retrieve the user information from local storage
        const fullName = localStorage.getItem("fullName") || "USER FULL NAME"
        const email = localStorage.getItem("email") || "USER EMAIL";
        const username = localStorage.getItem("username") || "USER USERNAME";

        const handleModeChange = (e) => {
            setSelectedMode(e.target.value);
        };
    
        // Event handler for difficulty selection
        const handleDifficultyChange = (e) => {
            setSelectedDifficulty(e.target.value);
        };

        const handleFruitChange = (e) => {
            setSelectedFruit(e.target.value);
        };

        const handleSubmit = async () => {
            try {
                // Validate dropdown selections
                if (!selectedFruit || selectedFruit === "0" || !selectedMode || selectedMode === "0") {
                    setErrorMessage("Please select both FRUIT and MODE.");
                    return;
                }
    
                let url = "http://localhost:8080";
    
                // Determine the endpoint based on dropdown selections
                if (selectedMode === "study" || selectedMode === "recall") {
                    url += "/scriptures";
                } else if (selectedMode === "quiz") {
                    url += "/questions";
                }
    
                // Add filters based on FRUIT and DIFFICULTY selections
                const params = new URLSearchParams();
                if (selectedFruit !== "Every Fruit") {
                    params.append("fruit", selectedFruit);
                }
                if (selectedDifficulty) {
                    params.append("difficulty", selectedDifficulty);
                }
    
                url += `?${params.toString()}`;
    
                const response = await fetch(url);
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
    
                const data = await response.json();
    
                // Process the response based on the MODE
                if (selectedMode === "study" || selectedMode === "recall") {
                    const scriptures = data.map(scripture => ({
                        id: scripture.id,
                        verse: scripture.verse,
                        scripture: scripture.scripture,
                    }));
                    setAllScriptures(scriptures);
                    setWordData(scriptures); // Display all scriptures
                } else if (selectedMode === "quiz") {
                    setQuestions(data);
                    setWordData(data); // Display all questions
                }

                setDisplayMode(selectedMode);

                setErrorMessage(""); // Clear any previous error messages
            } catch (error) {
                setErrorMessage("Failed to fetch data. Please try again.");
            }
        };

        // Update the current timestamp dynamically
            useEffect(() => {
                const updateTimestamp = () => {
                    const now = new Date();
                    const formattedDate = now.toLocaleDateString("en-US", {
                        weekday: "short",
                        year: "numeric",
                        month: "short",
                        day: "numeric",
                    });
                    const formattedTime = now.toLocaleTimeString("en-US", {
                        hour: "2-digit",
                        minute: "2-digit",
                        second: "2-digit",
                    });
                    setCurrentTimestamp(`${formattedDate}, ${formattedTime}`);
                };

                updateTimestamp();
                const interval = setInterval(updateTimestamp, 1000); // Update every second

                return () => clearInterval(interval); // Cleanup interval on component unmount
            }, []);

    return (
        <div id="foths-main">
           
            <AdminHeader/>

            {/* Dynamic Component that receives user input to display in another element */}
            <div className="user-account-aside">
                <div className="utilities">Utilities</div>
                <div className="util-bible"><UtilBible/> </div>
                <div className="util-timer"><Pomodoro/></div>
                <div id="app"></div>
            </div>

            <div className="foths-main">
                <div className="foths-main-title"> Account Dashboard </div>

                <main className="ua-study-window"> </main>

                <main id='ua-window' className="ua-study-window"> 
                    {wordData ? (
                        <table className="fetch-table" border="1">
                            <thead>
                                <tr>
                                    {displayMode === "study" ? (
                                        <>
                                            <th className="fetch-header">Verse</th>
                                            <th className="fetch-header">Scripture</th>
                                        </>
                                    ) : displayMode === "recall" ? (
                                        <>
                                            <th className="fetch-header">Scripture</th>
                                            <th className="fetch-header">Verse</th>
                                        </>
                                    ) : (
                                        <>
                                            <th className="fetch-header">Question</th>
                                            <th className="fetch-header">Difficulty</th>
                                        </>
                                    )}
                                </tr>
                            </thead>
                            <tbody>
                                {displayMode === "study" ? (
                                    allScriptures.map((item, index) => (
                                        <tr key={index}>
                                            <td className="fetch-cell">{item.verse}</td>
                                            <td className="fetch-cell">{item.scripture}</td>
                                        </tr>
                                    ))
                                ) : displayMode === "recall" ? (
                                    allScriptures.map((item, index) => (
                                        <tr key={index}>
                                            <td className="fetch-cell">{item.scripture}</td>
                                            <td className="fetch-cell">
                                                <input 
                                                    className="ua-quiz-input" 
                                                    placeholder="Enter Answer"
                                                />
                                            </td>
                                        </tr>
                                    ))
                                ) : (
                                    questions.map((item, index) => (
                                        <tr key={index}>
                                            <td className="fetch-cell">{item.questions}</td>
                                            <td className="fetch-cell">{item.difficulty}</td>
                                        </tr>
                                    ))
                                )}
                            </tbody>
                        </table>
                    ) : (
                        <p>Make a Selection!</p>
                    )}
                </main>

                {/* Main window where data is fetched */}
                <main className="ua-fetch-window"> 
                    <select id="goals" value={selectedFruit} className="ua-study-select" onChange={handleFruitChange}>
                        <option value="0">FRUIT</option>
                        <option value="Every Fruit">Every Fruit</option>
                        <option value="Faith">Faith</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <select id="goals" className="ua-study-select" value={selectedMode} onChange={handleModeChange}>
                        <option value="0">MODE</option>
                        <option value="study">Study</option>
                        <option value="recall">Recall</option>
                    </select> <br /> <br className="desktop-scope-breakpoint" />
                    <select id="goals" className="ua-study-select" value={selectedDifficulty} onChange={handleDifficultyChange}>
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
                <div className="user-info-column">{fullName.toUpperCase()}  </div>
                
                <div className="ua-user-info-card">
                <p className="user-info-title"><b>User Information</b></p>
                    <div className="user-information">
                        <li className="user-field">{email}</li>
                        <li className="user-field">{username}</li>
                    </div>
                </div>
                <div className="ua-user-scope-display">
                    <p className="usd-title"><b>Video Resources</b></p> <br/>
                    <div className="usd-window">
                    <iframe 
                        width="100%" 
                        height="100%" 
                        src="https://www.youtube.com/embed/7tGDumsawjk?autoplay=1&mute=1" 
                        frameBorder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                        allowFullScreen>
                    </iframe>
                    </div>
                </div>
                <div className="ua-user-recent-activity">
                    {/* <p className="ura-title">Date & Time</p> */}
                    <div className="ua-ura-window">
                        <p id='ua-window-text' className="ura1"> {currentTimestamp}</p>
                    </div>
                </div>
            </div>

            <AccountFooter/>

        </div>

    )
}

export default UserAccount;