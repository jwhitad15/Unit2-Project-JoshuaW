// Fill-in-the-blank component for Recall Mode

import React, {useState, useEffect} from "react";
import { FaArrowRightLong, FaArrowLeftLong } from "react-icons/fa6";
import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";
import 'reactjs-popup/dist/index.css'
import './recall.css';

// const faithScripture = [
  
//     {
//         name: "2 Corinthians 5:7",
//         verse: "For we walk by faith, not by sight.",
//         level: "easy",
//         id: 0
//     },
//     {
//         name: "Romans 10:17",
//         verse: "So then faith cometh by hearing, and hearing by the word of God.",
//         level: "easy",
//         id: 1
//     },
//     {
//         name: "Mark 9:23",
//         verse: "Jesus said unto him, 'If thou canst believe, all things are possible to him that believeth.'",
//         level: "easy",
//         id: 2
//     },
//     {
//         name: "Matthew 21:22",
//         verse: "And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.",
//         level: "easy",
//         id: 3
//     },
//     {
//         name: "James 2:17",
//         verse: "Even so faith, if it hath not works, is dead, being alone.",
//         level: "easy",
//         id: 4
//     },
//     {
//         name: "Habakkuk 2:4",
//         verse: "Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.",
//         level: "easy",
//         id: 5
//     },
//     {
//         name: "2 Timothy 2:13",
//         verse: "If we believe not, yet he abideth faithful: he cannot deny himself.",
//         level: "easy",
//         id: 6
//     },
//     {
//         name: "1 John 5:4",
//         verse: "For whatsoever is born of God overcometh the world: and this is the victory that overcometh the world, even our faith.",
//         level: "intermediate",
//         id: 7
//     },
//     {
//         name: "Ephesians 2:8-9",
//         verse: "For by grace are ye saved through faith, and that not of yourselves. It is the gift of God - not of works, lest any man should boast.",
//         level: "intermediate",
//         id: 8
//     },
//     {
//         name: "James 1:3,6",
//         verse: "Knowing this, that the trying of your faith works patience...But let him ask in faith, nothing wavering. For he that wavers is like a wave of the sea driven with the wind and tossed.",
//         level: "intermediate",
//         id: 9
//     },
//     {
//         name: "Matthew 17:20-21",
//         verse: "And Jesus said unto them, Because of your unbelief: for verily I say unto you, If ye have faith as a grain of mustard seed, ye shall say unto this mountain, Remove hence to yonder place; and it shall remove; and nothing shall be impossible unto you. Howbeit this kind goeth not out but by prayer and fasting.",
//         level: "difficult",
//         id: 10
//     },
//     {
//         name: "Hebrews 11:1-3",
//         verse: "Now faith is the substance of things hoped for, the evidence of things not seen. For by it the elders obtained a good report. Through faith we understand that the worlds were framed by the word of God, so that things which are seen were not made of things which do appear.",
//         level: "difficult",
//         id: 11
//     },
//     {
//         name: "Hebrews 11:6",
//         verse: "But without faith it is impossible to please him: for he that cometh to God must believe that he is, and that he is a rewarder of them that diligently seek him.",
//         level: "difficult",
//         id: 12
//     },
//     {
//         name: "Hebrews 11:11",
//         verse: "Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised.",
//         level: "difficult",
//         id: 13
//     }  
//  ]

 
 const Recall = () => {
     const [wordData, setWordData] = useState(null); // Current scripture
     const [val, setVal] = useState(0); // Current index
     const [faithScriptures, setFaithScriptures] = useState([]); // Filtered scriptures with FRUIT value of 'Faith'
     const [userInput, setUserInput] = useState(""); // User input for recall mode
     const [validationMessage, setValidationMessage] = useState(""); // Message for validation feedback
     const [validationColor, setValidationColor] = useState(""); // Font color for validation feedback
     const [isModalOpen, setIsModalOpen] = useState(false); // State to toggle modal visibility
 
     // Navigate to the next scripture
     const handleNext = () => {
         if (val < faithScriptures.length - 1) {
             const nextIndex = val + 1;
             setVal(nextIndex);
             setWordData(faithScriptures[nextIndex]);
             setUserInput(""); // Clear input for the next scripture
             setValidationMessage(""); // Clear validation message
             setValidationColor(""); // Clear validation color
             
         }
     };
 
    //  // Navigate to the previous scripture
    //  const handlePrevious = () => {
    //      if (val > 0) {
    //          const prevIndex = val - 1;
    //          setVal(prevIndex);
    //          setWordData(faithScriptures[prevIndex]);
    //          setUserInput(""); // Clear input for the previous scripture
    //          setValidationMessage(""); // Clear validation message
    //          setValidationColor(""); // Clear validation color
    //      }
    //  };
 
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
             const filteredScriptures = data.filter(scripture => scripture.fruit === 'Faith');
             setFaithScriptures(filteredScriptures);
 
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
                setValidationMessage("That is correct"); // Display success message
                setValidationColor("white"); // Set font color to green for correct answers
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
 
     return (
         <div id="foths-main">
             <div className="study-header">
                 <FourElementHeader />
             </div>
 
             {/* <div>
                 <button
                     onClick={handleNext}
                     className="study-next-button"
                     disabled={val >= faithScriptures.length - 1} // Disable Next button if at the last scripture
                 >
                     <div id="study-button-text"> Next </div>
                     <div id="study-button-icon"> <FaArrowRightLong /> </div>
                 </button>
             </div>
 
             <div>
                 <button
                     onClick={handlePrevious}
                     className="study-previous-button"
                     disabled={val <= 0} // Disable Previous button if at the first scripture
                 >
                     <div id="study-button-text"> Previous </div>
                     <div id="study-button-icon"> <FaArrowLeftLong /> </div>
                 </button>
             </div> */}
 
             <main className="study-display-verse">
                <div>
                    {wordData && wordData.fruit === 'Faith' ? (
                        <p>{wordData.scripture}</p>
                    ) : (
                        <p>No scriptures available</p>
                    )}
                </div>
                 <br />
                 <div className="study-title"> Recall Mode </div>
             </main>
 
             <form className="verse-name" onSubmit={validateInput}>
             <input type="text" className="recall-input" placeholder="Enter your answer here..." value={userInput} onChange={(e) => setUserInput(e.target.value)} />
             </form>

{/* <p className="validation-message">{validationMessage}</p> Display validation feedback */}
            {/* Popup Modal */}
            {isModalOpen && (
                <div className="modal">
                    <div className="modal-content">
                        <p style={{ color: validationColor }}>{validationMessage}</p> {/* Dynamic font color */}
                        <button className="close-button" onClick={handleCloseModal}>Close</button>
                    </div>
                </div>
            )}  
             

             {/* <form className="scope-goals-input" onSubmit={validateInput}>
                <button type="submit" className="recall-button-class" >Submit</button>
            </form> */}
 
             

             <Footer />
         </div>
     );
 };
 
 export default Recall;