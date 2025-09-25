// Fill-in-the-blank component for Recall Mode

import React, {useState, useEffect, useContext} from "react";
import { SelectionLogic } from "../foths/SelectionLogic.jsx"; // Import the context
import FourElementHeader from "../header-components/FourElementHeader.jsx";
import Footer from "../footer/Footer.jsx";
import 'reactjs-popup/dist/index.css'
import './Recall.css';


 
 const Recall = () => {
     const [wordData, setWordData] = useState(null); // Current scripture
     const [val, setVal] = useState(0); // Current index
     const [filteredScriptures, setFilteredScriptures] = useState([]); // Filtered scriptures with FRUIT value of 'Faith'
     const [userInput, setUserInput] = useState(""); // User input for recall mode
     const [validationMessage, setValidationMessage] = useState(""); // Message for validation feedback
     const [validationColor, setValidationColor] = useState(""); // Font color for validation feedback
     const [isModalOpen, setIsModalOpen] = useState(false); // State to toggle modal visibility
     const { fruitSelection } = useContext(SelectionLogic);
     const [scriptureData, setScriptureData] = useState([]);
 
     // Navigate to the next scripture
     const handleNext = () => {
         if (val < filteredScriptures.length - 1) {
             const nextIndex = val + 1;
             setVal(nextIndex);
             setWordData(filteredScriptures[nextIndex]);
             setUserInput(""); // Clear input for the next scripture
             setValidationMessage(""); // Clear validation message
             setValidationColor(""); // Clear validation color
             
         }
     };
 
     useEffect(() => {
         fetchScripture();
     }, []);
 
     const fetchScripture = async () => {
         try {
             const response = await fetch('http://localhost:8080/scriptures'); // Fetch all scriptures
             console.log('Response status:', response.status); 
             const data = await response.json();
             console.log('Scripture data fetched successfully:', data);
 
             // Filter scriptures with FRUIT value of 'Faith'
             const filteredScriptures = data.filter((scripture) => scripture.fruit === fruitSelection);
             setFilteredScriptures(filteredScriptures);
 
             // Set the initial scripture to display
             if (filteredScriptures.length > 0) {
                 setWordData(filteredScriptures[0]);
             }
         } catch (error) {
             console.error('Error fetching scripture:', error);
         }
     };

     // Validate user input against the ANSWER column
     const validateInput = async (event) => {
        event.preventDefault(); // Prevent default form submission behavior
    
        if (!wordData || !wordData.scripture || !userInput.trim()) {
            setValidationMessage("Invalid input. Please try again.");
            setValidationColor("white"); // Set font color to white
            setIsModalOpen(true); // Open the modal
            return;
        }
        try {
            // Compare user input with the VERSE column value
            if (userInput.trim().toLowerCase() === wordData.verse.toLowerCase()) {
                setValidationMessage("That is correct!"); // Display success message
                setValidationColor("white"); // Set font color to white for correct answers
            } else {
                setValidationMessage("That is incorrect. Please try again"); // Display error message
                setValidationColor("white"); // Set font color to white for incorrect answers
            }
            setIsModalOpen(true); // Open the modal after validation
        } catch (error) {
            console.error('Error validating answer:', error);
            setValidationMessage("An error occurred while validating your answer.");
            setValidationColor("white"); // Set font color to white for errors
            setIsModalOpen(true); // Open the modal after validation
        }
    };

    // Add a listener for the Enter key
    const handleKeyPress = (event) => {
        if (event.key === 'Enter') {
            validateInput(event); // Trigger validation logic on Enter key press
        }
    };
    
    const handleCloseModal = () => {
        setIsModalOpen(false); // Close the modal
        if (validationMessage === "That is correct!") {
            handleNext(); // Navigate to the next question if the answer is correct
        }
    };

    useEffect(() => {
        window.addEventListener('keydown', handleKeyPress); // Add listener for Enter key
        return () => {
            window.removeEventListener('keydown', handleKeyPress); // Clean up listener
        };
    }, [userInput, wordData]); // Re-run effect when userInput or wordData changes

    useEffect(() => {
        fetchScripture();
      }, [fruitSelection]);
 
     return (
         <div id="foths-main">
             <div className="study-header">
                 <FourElementHeader />
             </div>
 
             <main className="study-display-verse">
                <div>
                    {wordData ? (
                        <p>{wordData.scripture}</p>
                    ) : (
                        <p>No scriptures available for {fruitSelection}</p>
                    )}
                </div>
                 <br />
                 <div className="study-title"> Recall Mode </div>
             </main>
 
             <form className="verse-name" onSubmit={validateInput}>
             <input type="text" className="recall-input" placeholder="Enter your answer here..." value={userInput} onChange={(e) => setUserInput(e.target.value)} />
             </form>

            {/* Popup Modal */}
            {isModalOpen && (
                <div className="modal">
                    <div className="modal-content">
                        <p style={{ color: validationColor }}>{validationMessage}</p> {/* Dynamic font color */}
                        <button className="close-button" onClick={handleCloseModal}>Close</button>
                    </div>
                </div>
            )}  
             
 
             

             <Footer />
         </div>
     );
 
    

};
 
 export default Recall;