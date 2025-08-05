// This component controls the Study Mode Scripture carousel
import React, {useEffect, useState} from "react";
import { FaArrowRightLong, FaArrowLeftLong } from "react-icons/fa6";
import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";
import Scriptures from "../../classes/scriptures";

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
// ]

const Study = () => {
    const [wordData, setWordData] = useState(null); // Current scripture
    const [val, setVal] = useState(0); // Current index
    const [faithScriptures, setFaithScriptures] = useState([]); // Filtered scriptures with FRUIT value of 'Faith'

    // Navigate to the next scripture
    const handleNext = () => {
        if (val < faithScriptures.length - 1) {
            const nextIndex = val + 1;
            setVal(nextIndex);
            setWordData(faithScriptures[nextIndex]);
        }
    };

    // Navigate to the previous scripture
    const handlePrevious = () => {
        if (val > 0) {
            const prevIndex = val - 1;
            setVal(prevIndex);
            setWordData(faithScriptures[prevIndex]);
        }
    };

    useEffect(() => {
        fetchScripture();
    }, []);

    const fetchScripture = async () => {
        try {
            const response = await fetch('http://localhost:8080/scriptures'); // Fetch all scriptures
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

    return (
        <div id="foths-main">
            <div className="study-header">
                <FourElementHeader />
            </div>

            <div>
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
            </div>

            <main className="study-display-verse">
                <div>
                    {wordData ? (
                        <p>{wordData.scripture}</p>
                    ) : (
                        <p>No scriptures available</p>
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