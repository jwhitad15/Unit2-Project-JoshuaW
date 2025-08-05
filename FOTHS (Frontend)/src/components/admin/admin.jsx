import React, { useState, useEffect } from "react";
import UserFetch from "./user-fetch";
import ScriptureFetch from "./scripture-fetch";
import QuestionFetch from "./question-fetch";
import AdminQuery from "./query";
import Music from "./music";
import AdminHeader from "../header-components/admin-header";
import FetchDataComponent from "./fetch-data";
import './admin.css';
import AccountFooter from "../footer/account-footer";



const Admin = () => {
    const [fetchedData, setFetchedData] = useState([]);
    const [selectedType, setSelectedType] = useState(""); 
    const [questionData, setQuestionData] = useState({});
    const [scriptureData, setScriptureData] = useState({}); // State to store question input data
    const [userData, setUserData] = useState({}); // State to store user input data
    const [selectedRecord, setSelectedRecord] = useState(null); // State to store the selected record
    const [popupText, setPopupText] = useState(""); // State for popup text
    const [isPopupVisible, setIsPopupVisible] = useState(false); // State for popup visibility

    useEffect(() => {
        if (fetchedData.length > 0) {
            const sortedData = [...fetchedData].sort((a, b) => a.id - b.id);
            setFetchedData(sortedData); // Update state with sorted data
        }
    }, [selectedType]);

    // Reset selectedRecord when selectedType changes
    useEffect(() => {
        setSelectedRecord(null); // Clear the selected record
    }, [selectedType]);

    const renderComponent = () => {
        if (selectedType === "users") {
          return <UserFetch setUserData={setUserData}/>;
        } else if (selectedType === "scriptures") {
          return <ScriptureFetch setScriptureData={setScriptureData}/>;
        } else if (selectedType === "questions") {
          return <QuestionFetch setQuestionData={setQuestionData}/>;
        } else {
          return <p></p>; 
        }
      };

    const handleCellClick = (text, record) => {
        setPopupText(text); // Set the text to display in the popup
        setIsPopupVisible(true); // Show the popup
        setSelectedRecord(record); // Update the state with the clicked record
    };

    const closePopup = () => {
        setIsPopupVisible(false); // Hide the popup
        setPopupText(""); // Clear the popup text
    };

    const getTitle = () => {
        if (selectedType === "users") {
            return "Profile";
        } else if (selectedType === "scriptures") {
            return "Scripture";
        } else if (selectedType === "questions") {
            return "Question";
        } else {
            return "Record Details"; // Default title
        }
    };



    return (
        <div id="foths-main">   
            <AdminHeader/>

            {/* Dynamic Component that receives user input to display in another element */}
            <div className="user-account-aside">
                <div className="utilities">Database Query</div>
                <div className="util-bible"><AdminQuery setFetchedData={setFetchedData} setSelectedType={setSelectedType} userData={userData} questionData={questionData} scriptureData={scriptureData}/> </div>
                <div className="util-timer"><Music/></div>
                <div id="app"></div>
            </div>

            <div className="foths-main">
                <div className="foths-main-title"> Administrative Dashboard </div>
                {renderComponent()}
                <main className="ua-study-window"></main>
                <main id='ua-window' className="ua-study-window"> <FetchDataComponent fetchedData={fetchedData} onCellClick={handleCellClick}/> </main>

            </div>
        
            {/* Flexbox stylization to create columns & column cards */}
            {/* <div className="user-nav-css">
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
            </div> */}

            <div className="user-nav-css">
                <div className="user-info-column">Query Details</div>
                
                <div className="user-info-card">
                    <p className="user-info-title">{getTitle()}</p>
                    <div className="user-information">
                        {/* Dynamically render the selected record's details */}
                        {selectedRecord ? (
                            <>
                                {selectedType === "users" && (
                                    <>
                                        <div className="user-field"><b>ID: </b>{selectedRecord.id}</div>
                                        <div className="user-field"><b>NAME: </b>{selectedRecord.firstName} {selectedRecord.lastName}</div>
                                        <div className="user-field"><b>EMAIL: </b>{selectedRecord.email}</div>
                                    </>
                                )}
                                {selectedType === "scriptures" && (
                                    <>
                                        <div className="user-field">{selectedRecord.scripture}</div>
                                    </>
                                )}
                                {selectedType === "questions" && (
                                    <>
                                        <div className="user-field">{selectedRecord.questions}</div>
                                    </>
                                )}
                            </>
                        ) : (
                            <p></p>
                        )}
                    </div>
                </div>

                {/* New card for displaying additional information */}
                <div className="user-scope-display">
                <p className="usd-title">
                    {selectedType === "users" && "Credentials"}
                    {selectedType === "scriptures" && "Verse"}
                    {selectedType === "questions" && "Answer"}
                </p>
                    <div className="user-information">
                    {selectedRecord ? (
                        <>
                            {selectedType === "users" && (
                                <>
                                <div className="user-scope-display-user-field"><b>USER: </b>{selectedRecord.username}</div>
                                <div className="user-scope-display-user-field"><b>PASS: </b>{selectedRecord.password}</div>
                                </>
                            )}
                            {selectedType === "scriptures" && (
                                <div className="user-scope-display-user-field">{selectedRecord.verse}</div>
                            )}
                            {selectedType === "questions" && (
                                <div className="user-scope-display-user-field">{selectedRecord.answer}</div>
                            )}
                        </>
                        ) : (
                            <p></p>
                        )}
                    </div>
                </div>

                {/* New card for displaying user's password */}
                <div className="user-recent-activity">
                <p className="ura-title">
                    {selectedType === "users" && "Additional Information"}
                    {selectedType === "scriptures" && "Additional Information"}
                    {selectedType === "questions" && "Additional Information"}
                </p>
                    <div className="user-information">
                        {selectedRecord ? (
                            <>
                                {selectedType === "users" && (
                                    <div className="user-field"></div>
                                )}
                                {selectedType === "scriptures" && (
                                    <>
                                        <div className="user-field">ID: {selectedRecord.id}</div>
                                        <div className="user-field">FRUIT: {selectedRecord.fruit}</div>
                                        <div className="user-field">TRANSLATION: {selectedRecord.translation}</div>
                                        <div className="user-field">DIFFICULTY: {selectedRecord.lod}</div>
                                    </>
                                )}
                                {selectedType === "questions" && (
                                    <>
                                        <div className="user-field">ID: {selectedRecord.id}</div>
                                        <div className="user-field">FRUIT: {selectedRecord.fruit}</div>
                                        <div className="user-field">TRANSLATION: {selectedRecord.translation}</div>
                                        <div className="user-field">DIFFICULTY: {selectedRecord.lod}</div>
                                    </>
                                )}
                            </>
                        ) : (
                            <p></p>
                        )}
                    </div>
                </div>
            </div>

            {/* Popup Modal */}
            {isPopupVisible && (
                <div className="popup-modal">
                    <div className="popup-content">
                        <p className="popup-text">{popupText}</p>
                        <button onClick={closePopup}>Close</button>
                    </div>
                </div>
            )}
            

            <AccountFooter/>

        </div>

    )
}

export default Admin;