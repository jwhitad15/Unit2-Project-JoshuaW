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

                    // Set the initial scripture to display
            if (data.length > 0) {
                setDailyScripture(`${data[0].verse}: ${data[0].scripture}`);
            }
         } catch (error) {
            console.error('Error fetching scripture:', error);
            setDailyScripture("Sorry, no scripture available today.");
        }
    };

    useEffect(() => {
        const currentDate = new Date().toISOString().split("T")[0];
        const lastFetchedDate = localStorage.getItem("lastFetchedDate");

        // Fetch scripture if it's a new day or no date is stored
        if (lastFetchedDate !== currentDate) {
            localStorage.setItem("lastFetchedDate", currentDate);
            fetchDailyScripture();
        }

        // Set up an interval to check for a new calendar day
        const interval = setInterval(() => {
            const newDate = new Date().toISOString().split("T")[0];
            const storedDate = localStorage.getItem("lastFetchedDate");

            if (storedDate !== newDate) {
                localStorage.setItem("lastFetchedDate", newDate);
                fetchDailyScripture(); // Fetch a new scripture for the new day
            }
        }, 1000 * 60 * 60); // Check every hour

        return () => clearInterval(interval); // Clean up the interval on component unmount
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
                <div className="recent-activity">Activity</div>
                <div className="recent-activity-card-1">
                    
                </div>
                <div className="recent-activity-card-2">
                <input type="text" className="ai-question-input" placeholder="Ask the AI a question..." value={userQuestion} onChange={handleQuestionChange}/>
                    <button className="ai-submit-button" onClick={handleAskAI}>Ask AI</button>
                </div>
                <div className="recent-activity-card-3"> <p><b>Verse of the Day</b></p>{dailyScripture ? <p>{dailyScripture}</p> : <p>Loading daily scripture...</p>}</div>
            </nav>

            <Footer/>

        </div>

    )
}

export default FOTHSMain;