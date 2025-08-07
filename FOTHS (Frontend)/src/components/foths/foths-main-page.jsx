import React, { useState, useEffect } from "react";
import UserInteraction from "./foths-user-interaction";
import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";
import FruitImage from "./foths-fruit-image";


const FOTHSMain = () => {

    const [userQuestion, setUserQuestion] = useState(""); // State to store the user's question
    const [aiResponse, setAIResponse] = useState(""); // State to store the AI's response
    const [dailyScripture, setDailyScripture] = useState(""); // State to store the daily scripture and verse

    const handleQuestionChange = (e) => {
        setUserQuestion(e.target.value); // Update the user's question
    };

    

    const handleAskAI = async () => {
        try {
            // Make an API call to your backend or AI service
            const response = await fetch("https://api.search.brave.com/res/v1/web/search", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({ question: userQuestion }),
            });

            if (!response.ok) {
                throw new Error("Failed to get AI response");
            }

            const data = await response.json();
            setAIResponse(data.answer); // Update the AI's response
        } catch (error) {
            console.error("Error fetching AI response:", error);
            setAIResponse("Sorry, I couldn't process your question. Please try again.");
        }
    };

    const fetchDailyScripture = async () => {
        try {
                const response = await fetch('http://localhost:8080/scriptures');
                const data = await response.json();

        // Ensure the data is an array and contains scripture objects
        if (Array.isArray(data) && data.length > 0 && data[0].verse && data[0].scripture) {
            setDailyScripture(`${data[0].verse}: ${data[0].scripture}`);
        } else {
            throw new Error("Invalid data structure returned from API");
        }
        } catch (error) {
            console.error('Error fetching scripture:', error);
            setDailyScripture("Sorry, no scripture available today.");
        }
    };

    useEffect(() => {
        fetchDailyScripture(); // Fetch the first scripture when the component mounts
    }, []);

    return (
        <div id="foths-main">

            <FourElementHeader/>

            {/* Dynamic Component that receives user input to display in another element */}
            <aside>
                <div className="scope">Scope</div>
                <div className="scope-card-1"><UserInteraction/> </div>
            </aside>

            <div className="foths-main">
                <div className="foths-main-title"> Fruits of the Holy Spirit </div>

                <div className="fruits-grid">
                    <div className="fruit-cards-row-1">
                        <a href="./#/game-mode" id="fruit-card-1-hyperlink" className="fruit-card-1"><div className="responsive-fruit-card-text">Faith</div><FruitImage/></a>
                    </div>
                </div>

            </div>
        
            {/* Flexbox stylization to create columns & column cards */}
            <nav>
                <div className="recent-activity">Resources</div>
                <div className="recent-activity-card-1">
                    <h2>Welcome to FOTHS</h2>
                    <hr style={{width: "98%"}}/>
                    <hr style={{width: "84%"}}/>
                    <br/>
                    <div className="intro-window" >
                    <p><b>FOTHS</b>, short for <b>Fruits of the Holy Spirit</b>, is an interactive, educational application designed to help users learn & retain the Bible.</p>
                    <p>This application comes equipped with 3 unique game modes: <b>Study, Recall, Quiz</b></p>
                    <p><b>Study</b> mode allows users to navigate through Scripture, while <b>Recall</b> mode resembles a traditional fill-in-the-blank question, enabling users to enter verse titles in a input field. </p>
                    <p><b>Quiz</b> mode tests users' knowledge by displaying Scripture and allowing them to select one of four answer choices.</p>
                    <p>Additionally, FOTHS offers a wide variety of interactice tools like a Pomodoro timer, Bible fetching elements, and video resources.</p>
                    <p>Take some time to explore this application, and don't forget to become familiar with the user account page - it will be where you spend most of your time!</p>
                    <p>Happy learning!</p>
                    </div>
                </div>
                {/* <div className="recent-activity-card-2">
                <input type="text" className="ai-question-input" placeholder="Ask the AI a question..." value={userQuestion} onChange={handleQuestionChange}/>
                    <button className="ai-submit-button" onClick={handleAskAI}>Ask AI</button>
                </div> */}
                <div className="recent-activity-card-3">
                    <div className="vod">
                    <p><b className="ua-ura-window">Verse of the Day</b></p>
                    {dailyScripture ? (
                        <p >
                            <i >"{dailyScripture.split(": ")[1]}"</i> {/* Italicized scripture in quotes */}
                            <br />
                            <b > {dailyScripture.split(": ")[0]}</b> {/* Bold verse name */}
                        </p>
                    ) : (
                        <p>Loading daily scripture...</p>
                    )}
                    <p><b className="ua-ura-window">Verse of the Day</b></p>
                    </div>
                </div>
            </nav>

            <Footer/>

        </div>

    )
}

export default FOTHSMain;``