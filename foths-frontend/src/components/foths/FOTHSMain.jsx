import React, { useState, useEffect, useContext } from "react";
import UserInteraction from "./UserInteraction";
import FourElementHeader from "../header-components/FourElementHeader";
import Footer from "../footer/Footer.jsx";
import FaithCard from "./fruit/FaithCard";
import LoveCard from "./fruit/LoveCard";
import PeaceCard from "./fruit/PeaceCard";
import JoyCard from "./fruit/JoyCard";
import TemperanceCard from "./fruit/TemperanceCard";
import MeeknessCard from "./fruit/MeeknessCard";
import GoodnessCard from "./fruit/GoodnessCard";
import GentlenessCard from "./fruit/GentlenessCard";
import LongsufferingCard from "./fruit/LongsufferingCard";

import mobileFaith from "./fruit/MobileFaith.png";
import mobileLove from "./fruit/MobileLove.png";
import mobilePeace from "./fruit/MobilePeace.png";
import mobileJoy from "./fruit/MobileJoy.png";
import mobileTemperance from "./fruit/MobileTemperance.png";
import mobileMeekness from "./fruit/MobileMeekness.png";
import mobileGoodness from "./fruit/MobileGoodness.png";
import mobileGentleness from "./fruit/MobileGentleness.png";
import mobileLongsuffering from "./fruit/MobileLongsuffering.png";
import ApiHelper from "../../classes/ApiHelper.js";
import { SelectionLogic } from "./SelectionLogic.jsx"; // Import the context


const FOTHSMain = () => {

    const { setFruitSelection } = useContext(SelectionLogic); // Use context to set fruit selection
    const [userQuestion, setUserQuestion] = useState(""); // State to store the user's question
    const [aiResponse, setAIResponse] = useState(""); // State to store the AI's response
    const [dailyScripture, setDailyScripture] = useState(""); // State to store the daily scripture and verse

    const handleQuestionChange = (e) => {
        setUserQuestion(e.target.value); // Update the user's question
    };

    const handleFruitSelection = (fruit) => {
        setFruitSelection(fruit); // Store the selected fruit globally
        window.location.href = "./#/game-mode"; // Navigate to GameMode page
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
        //   const token = localStorage.getItem("jwtToken");
      
          const response = await fetch(`${ApiHelper.baseUrl}/scriptures`, {
            method: "GET",
            credentials: "include", // Include cookies for session management
            // headers: {
            //   "Authorization": `Bearer ${token}`,
            //   "Content-Type": "application/json"
            // }
          });
      
          if (!response.ok) {
            throw new Error(`HTTP ${response.status}`);
          }
      
          const data = await response.json();
      
          if (Array.isArray(data) && data.length > 0) {
            const random = data[Math.floor(Math.random() * data.length)];
            setDailyScripture(`${random.verse}: ${random.scripture}`);
          } else {
            throw new Error("No scriptures returned");
          }
        } catch (error) {
          console.error("Error fetching scripture:", error);
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
                {/* <div className="scope-card-2"></div> */}
            </aside>

            <div className="foths-main">
                <div className="foths-main-title"> Fruits of the Holy Spirit </div>
                <div className="fruits-grid">
                    <div className="fruit-cards-row-1">
                        <a href="./#/game-mode" id="fruit-card-1-hyperlink" className="fruit-card-1" onClick={() => handleFruitSelection('Faith')}> <div className="responsive-fruit-card-text">Faith</div> <img src={mobileFaith} className="mobile-faith" alt="mobile-faith-image" /><FaithCard/> </a>
                        <a href="./#/game-mode" id="fruit-card-2-hyperlink" className="fruit-card-2" onClick={() => handleFruitSelection('Love')}><div className="responsive-fruit-card-text">Love</div><img src={mobileLove} className="mobile-love" alt="mobile-love-image" /><LoveCard/></a>
                        <a href="./#/game-mode" id="fruit-card-3-hyperlink" className="fruit-card-3" onClick={() => handleFruitSelection('Peace')}><div className="responsive-fruit-card-text">Peace</div><img src={mobilePeace} className="mobile-peace" alt="mobile-peace-image" /><PeaceCard/></a>
                        <a href="./#/game-mode" id="fruit-card-4-hyperlink" className="fruit-card-4" onClick={() => handleFruitSelection('Joy')}><div className="responsive-fruit-card-text">Joy</div><img src={mobileJoy} className="mobile-joy" alt="mobile-joy-image" /><JoyCard/></a>
                        <a href="./#/game-mode" id="fruit-card-5-hyperlink" className="fruit-card-5" onClick={() => handleFruitSelection('Temperance')}><div className="responsive-fruit-card-text">Temperance</div><img src={mobileTemperance} className="mobile-temperance" alt="mobile-temperance-image" /><TemperanceCard/></a>
                        <a href="./#/game-mode" id="fruit-card-6-hyperlink" className="fruit-card-6" onClick={() => handleFruitSelection('Meekness')}><div className="responsive-fruit-card-text">Meekness</div><img src={mobileMeekness} className="mobile-meekness" alt="mobile-meekness-image" /><MeeknessCard/></a>
                        <a href="./#/game-mode" id="fruit-card-7-hyperlink" className="fruit-card-7" onClick={() => handleFruitSelection('Goodness')}><div className="responsive-fruit-card-text">Goodness</div><img src={mobileGoodness} className="mobile-goodness" alt="mobile-goodness" /><GoodnessCard/></a>
                        <a href="./#/game-mode" id="fruit-card-8-hyperlink" className="fruit-card-8" onClick={() => handleFruitSelection('Gentleness')}><div className="responsive-fruit-card-text">Gentleness</div><img src={mobileGentleness} className="mobile-gentleness" alt="mobile-gentleness-image" /><GentlenessCard/></a>
                        <a href="./#/game-mode" id="fruit-card-9-hyperlink" className="fruit-card-9" onClick={() => handleFruitSelection('Longsuffering')}><div className="responsive-fruit-card-text">Longsuffering</div><img src={mobileLongsuffering} className="mobile-longsuffering" alt="mobile-longsuffering-image" /><LongsufferingCard/></a>
                    </div>
                </div>
            </div>
        
            {/* Flexbox stylization to create columns & column cards */}
            <nav>
                <div className="recent-activity">Resources</div>
                <div className="foths-intro" >
                    <p className="welcome-title">Welcome to FOTHS</p>
                    <hr className="intro-line" style={{width: "98%"}}/>
                    <hr className="intro-line" style={{width: "84%"}}/>
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

                <div className="recent-activity-card-2">
                    <div className="intro-window2" >
                    <div className="intro-words">
                        <h2>Welcome to FOTHS</h2>
                        <p><b>FOTHS</b>, short for <b>Fruits of the Holy Spirit</b>, is an interactive, educational application designed to help users learn & retain the Bible.</p>
                        <p>This application comes equipped with 3 unique game modes: <b>Study, Recall, Quiz</b></p>
                        <p><b>Study</b> mode allows users to navigate through Scripture, while <b>Recall</b> mode resembles a traditional fill-in-the-blank question, enabling users to enter verse titles in a input field. </p>
                        <p><b>Quiz</b> mode tests users' knowledge by displaying Scripture and allowing them to select one of four answer choices.</p>
                        <p>Additionally, FOTHS offers a wide variety of interactice tools like a Pomodoro timer, Bible fetching elements, and video resources.</p>
                        <p>Take some time to explore this application, and don't forget to become familiar with the user account page - it will be where you spend most of your time!</p>
                        <p>Happy learning!</p>
                    </div>
                    </div>
                </div>
         
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