import React, { useState } from "react";
import Footer from "../footer/footer";
import UserFetch from "./user-fetch";
import ScriptureFetch from "./scripture-fetch";
import QuestionFetch from "./question-fetch";
import AdminQuery from "./query";
import Music from "./music";
import AdminHeader from "../header-components/admin-header";
import FetchDataComponent from "./fetch-data";
import './admin.css';



const Admin = () => {
    const [fetchedData, setFetchedData] = useState([]);
    const [selectedType, setSelectedType] = useState(""); 
    const [questionData, setQuestionData] = useState({});
    const [scriptureData, setScriptureData] = useState({}); // State to store question input data
    const [userData, setUserData] = useState({}); // State to store user input data
    const [selectedRecord, setSelectedRecord] = useState(null); // State to store the selected record

    const renderComponent = () => {
        if (selectedType === "users") {
          return <UserFetch setUserData={setUserData}/>;
        } else if (selectedType === "scriptures") {
          return <ScriptureFetch setScriptureData={setScriptureData}/>;
        } else if (selectedType === "questions") {
          return <QuestionFetch setQuestionData={setQuestionData}/>;
        } else {
          return <p></p>; // Default content
        }
      };

    const handleRecordClick = (record) => {
        setSelectedRecord(record); // Update the state with the clicked record
    };

    const getTitle = () => {
        if (selectedType === "users") {
            return "Profile";
        } else if (selectedType === "scriptures") {
            return "Verse";
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
                <main id='ua-window' className="ua-study-window"> <FetchDataComponent fetchedData={fetchedData} onRecordClick={handleRecordClick}/> </main>

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
                                        <div className="user-field">NAME: {selectedRecord.firstName} {selectedRecord.lastName}</div>
                                        <div className="user-field">USER: {selectedRecord.username}</div>
                                        <div className="user-field">ID: {selectedRecord.id}</div>
                                    </>
                                )}
                                {selectedType === "scriptures" && (
                                    <>
                                        <div className="user-field">VERSE: {selectedRecord.verse}</div>
                                        <div className="user-field">ID: {selectedRecord.id}</div>
                                    </>
                                )}
                                {selectedType === "questions" && (
                                    <>
                                        <div className="user-field">QUESTION: {selectedRecord.questions}</div>
                                        <div className="user-field">ID: {selectedRecord.id}</div>
                                    </>
                                )}
                            </>
                        ) : (
                            <p>Select a record to view details</p>
                        )}
                    </div>
                </div>
            </div>


            <Footer/>

        </div>

    )
}

export default Admin;