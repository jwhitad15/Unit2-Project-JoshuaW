// This component controls the Study Mode Scripture carousel
import React, {useEffect, useState, useContext} from "react";
import { FaArrowRightLong, FaArrowLeftLong } from "react-icons/fa6";
import FourElementHeader from "../header-components/FourElementHeader.jsx";
import Footer from "../footer/Footer.jsx";
import { SelectionLogic } from "./SelectionLogic.jsx"; // Import the context
import ApiHelper from "../../ApiHelper.js";


const Study = () => {
    const [wordData, setWordData] = useState(null); // Current scripture
    const [val, setVal] = useState(0); // Current index
    const [filteredScriptures, setFilteredScriptures] = useState([]); // Filtered scriptures based on fruitSelection
    const { fruitSelection } = useContext(SelectionLogic); // Get the selected fruit from context
    // Navigate to the next scripture
    const handleNext = () => {
        if (val < filteredScriptures.length - 1) {
            const nextIndex = val + 1;
            setVal(nextIndex);
            setWordData(filteredScriptures[nextIndex]);
        }
    };

    // Navigate to the previous scripture
    const handlePrevious = () => {
        if (val > 0) {
            const prevIndex = val - 1;
            setVal(prevIndex);
            setWordData(filteredScriptures[prevIndex]);
        }
    };

    const fetchScripture = async () => {
        try {
            const response = await fetch(`${ApiHelper.baseUrl}/scriptures`, {
                method: "GET",
                credentials: "include" // <-- send cookies for authentication
            });
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            console.log("Scripture data fetched successfully:", data);

          // Filter scriptures based on the selected fruit
            const filtered = data.filter((scripture) => scripture.fruit === fruitSelection);
            setFilteredScriptures(filtered);

            if (filtered.length > 0) {
                setWordData(filtered[0]);
            }
        } catch (error) {
            console.error("Error fetching scripture:", error);
            if (error.message.includes('CORS')) {
                alert('CORS error: Please check your backend configuration.');
            }
        }
    };
    
    useEffect(() => {
    fetchScripture(); // Fetch scriptures when the component mounts
    }, [fruitSelection]); // Re-fetch scriptures when fruitSelection changes

    return (
        <div id="foths-main">
            <div className="study-header">
                <FourElementHeader />
            </div>

            <div>
                <button
                    onClick={handleNext}
                    className="study-next-button"
                    disabled={val >= filteredScriptures.length - 1} // Disable Next button if at the last scripture
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
                <div className="study-title"> Study Mode </div>
            </main>

            <div className="verse-name">
                <p className="verse-size"> {wordData?.verse} </p>
            </div>

            <div className="return-to-foths-from-study">
                <a id="return-to-dashboard-hyperlink" href="./#/foths">Home</a>
            </div>

            <Footer />
        </div>
    );
};

export default Study;