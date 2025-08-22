import FourElementHeader from "../header-components/FourElementHeader";
import Footer from "../footer/Footer";
import { SelectionLogic } from "./SelectionLogic.jsx"; // Import the context
import React, { useContext } from "react";


const GameMode = () => {
    const { setGameModeSelection } = useContext(SelectionLogic);

    const handleGameModeSelection = (mode) => {
        setGameModeSelection(mode); // Store the selected game mode globally
    };

    return (
        <div id="main">

            <div className="game-mode-header">
                <FourElementHeader/>
            </div>

            <main className="game-mode-cards">
                <div className="game-mode-title"> Game Mode </div>
                <a href="./#/study" id="game-mode-hyperlink" className="game-card-1" onClick={() => handleGameModeSelection("Study")}> Study </a>
                <a href="./#/recall" id="game-mode-hyperlink" className="game-card-2" onClick={() => handleGameModeSelection("Recall")}> Recall </a>
                <a href="./#/multichoice" id="game-mode-hyperlink" className="game-card-3" onClick={() => handleGameModeSelection("Multichoice")}> Quiz </a> 
            </main>
       
            <Footer/>

        </div>

    )
}

export default GameMode;