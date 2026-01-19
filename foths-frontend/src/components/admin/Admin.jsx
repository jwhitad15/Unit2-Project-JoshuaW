import React, { useState, useEffect } from "react";
import UserFetch from "./UserFetch";
import ScriptureFetch from "./ScriptureFetch";
import QuestionFetch from "./QuestionFetch";
import AdminQuery from "./AdminQuery";
import Music from "./Music";
import AdminHeader from "../header-components/AdminHeader";
import FetchDataComponent from "./FetchDataComponent";
import './admin.css';
import AccountFooter from "../footer/AccountFooter";



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
                <div className="utilities"><img src="src/components/admin/images/MobileControlsImage.svg" className="mobile-faith" alt="mobile-faith-image" /><div className="desktop-control-center">Controls</div></div>
                <div className="util-bible"><AdminQuery setFetchedData={setFetchedData} setSelectedType={setSelectedType} userData={userData} questionData={questionData} scriptureData={scriptureData}/> </div>
                <div className="util-timer"><Music/></div>
                <div id="app"></div>
            </div>

            <div className="account-main">
                <div className="foths-main-title"> Administrative Dashboard </div>
                {renderComponent()}
                <main className="ua-study-window"></main>
                <main id='ua-window' className="ua-study-window"> <FetchDataComponent fetchedData={fetchedData} onCellClick={handleCellClick}/> </main>

            </div>

            <div className="user-nav-css">
                <div className="admin-info-column"><img src="src/components/admin/images/MobileDetailsImage.svg" className="mobile-record-details" alt="mobile-faith-image" /><div className="desktop-record-details">Details</div></div>
                
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
                    {selectedType === "users" && "Additional"}
                    {selectedType === "scriptures" && "Additional"}
                    {selectedType === "questions" && "Additional"}
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