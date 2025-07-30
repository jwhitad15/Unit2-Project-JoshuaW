// Fill-in-the-blank component for Recall Mode

import React, {useState} from "react";
import { FaArrowRightLong, FaArrowLeftLong } from "react-icons/fa6";
import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";
import Popup from 'reactjs-popup'
import 'reactjs-popup/dist/index.css'


const Recall = ({}) => {

    const faithScripture = [
  
   {
       name: "2 Corinthians 5:7",
       verse: "For we walk by faith, not by sight.",
       level: "easy",
       id: 0
   },
   {
       name: "Romans 10:17",
       verse: "So then faith cometh by hearing, and hearing by the word of God.",
       level: "easy",
       id: 1
   },
   {
       name: "Mark 9:23",
       verse: "Jesus said unto him, 'If thou canst believe, all things are possible to him that believeth.'",
       level: "easy",
       id: 2
   },
   {
       name: "Matthew 21:22",
       verse: "And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.",
       level: "easy",
       id: 3
   },
   {
       name: "James 2:17",
       verse: "Even so faith, if it hath not works, is dead, being alone.",
       level: "easy",
       id: 4
   },
   {
       name: "Habakkuk 2:4",
       verse: "Behold, his soul which is lifted up is not upright in him: but the just shall live by his faith.",
       level: "easy",
       id: 5
   },
   {
       name: "2 Timothy 2:13",
       verse: "If we believe not, yet he abideth faithful: he cannot deny himself.",
       level: "easy",
       id: 6
   },
   {
       name: "1 John 5:4",
       verse: "For whatsoever is born of God overcometh the world: and this is the victory that overcometh the world, even our faith.",
       level: "intermediate",
       id: 7
   },
   {
       name: "Ephesians 2:8-9",
       verse: "For by grace are ye saved through faith, and that not of yourselves. It is the gift of God - not of works, lest any man should boast.",
       level: "intermediate",
       id: 8
   },
   {
       name: "James 1:3,6",
       verse: "Knowing this, that the trying of your faith works patience...But let him ask in faith, nothing wavering. For he that wavers is like a wave of the sea driven with the wind and tossed.",
       level: "intermediate",
       id: 9
   },
   {
       name: "Matthew 17:20-21",
       verse: "And Jesus said unto them, Because of your unbelief: for verily I say unto you, If ye have faith as a grain of mustard seed, ye shall say unto this mountain, Remove hence to yonder place; and it shall remove; and nothing shall be impossible unto you. Howbeit this kind goeth not out but by prayer and fasting.",
       level: "difficult",
       id: 10
   },
   {
       name: "Hebrews 11:1-3",
       verse: "Now faith is the substance of things hoped for, the evidence of things not seen. For by it the elders obtained a good report. Through faith we understand that the worlds were framed by the word of God, so that things which are seen were not made of things which do appear.",
       level: "difficult",
       id: 11
   },
   {
       name: "Hebrews 11:6",
       verse: "But without faith it is impossible to please him: for he that cometh to God must believe that he is, and that he is a rewarder of them that diligently seek him.",
       level: "difficult",
       id: 12
   },
   {
       name: "Hebrews 11:11",
       verse: "Through faith also Sara herself received strength to conceive seed, and was delivered of a child when she was past age, because she judged him faithful who had promised.",
       level: "difficult",
       id: 13
   }  
]

    const [wordData, setWordData] = useState(faithScripture[0])
    const [val, setVal] = useState(0)


    // event handler functions that control the Previous & Next Arrows
    // also includes logic that disables Previous button on first slide & Next button on last slide
    const handleClick=(index)=>{
    setVal(index)
    const wordSlider=faithScripture[index];
    setWordData(wordSlider)
    }
    const handleNext=()=>{
    let index = val < faithScripture.length -1 ? val + 1 : val;
    setVal(index)
    const wordSlider=faithScripture[index];
    setWordData(wordSlider)
    setVerseInput('')
    setVerseSubmit('')
    }
    const handlePrevious=()=>{
    let index = val <= faithScripture.length -1 && val > 0 ? val - 1 : val;
    setVal(index)
    const wordSlider=faithScripture[index];
    setWordData(wordSlider)
    setVerseInput('')
    setVerseSubmit('')
    }


    const [verseInput, setVerseInput] = useState('');
    const [verseSubmit, setVerseSubmit] = useState('');
    const [isValid, setIsValid] = useState('');
    const [showPopup, setShowPopup] = useState(false);

    const handleSubmit = e => {
        if (verseInput.toLowerCase().trim() === wordData.name.toLowerCase()){
            setIsValid(true)
            setShowPopup(true)
        }
        else {
            setIsValid(false)
            setShowPopup(true)
        }
        e.preventDefault();
        setVerseSubmit(verseInput)
        setVerseInput('')
    };

    const handleChange = e => {
        setVerseInput(e.target.value)
    };

     const closePopup = () => {
        setShowPopup(false);
    };

    return (
        <div id="foths-main">
            
            <div className="study-header">
                <FourElementHeader/>
            </div>
        
            <div>
                <button onClick={handleNext} className="study-previous-button">
                    <div id="study-button-text"> Next </div>
                    <div id="study-button-icon"> <FaArrowRightLong/> </div>
                </button>
            </div>

            {/* event handling inserted on buttons */}
            <div>
                <button onClick={handlePrevious} className="study-next-button">
                    <div id="study-button-text"> Previous </div> 
                    <div id="study-button-icon"> <FaArrowLeftLong/> </div>  
                </button>
            </div>

            <main className="study-display-verse">


                <p> {wordData.verse} </p>


                    {/* using .map() to cycle through Scripture data */}
                    {faithScripture.map((data,i) =>


                        <div key={i}>
                            <p onClick={()=>handleClick(i)} ></p>
                        </div>
                        
                    )}


                <div className="study-title"> Recall Mode </div>
            
            </main>

            <div className="verse-name">
                
                <p className="verse-size"> 
                    <input maxLength='50' minLength='4' className="recall-input" type="text" placeholder="Enter Full Verse" value={verseInput} onChange={handleChange} size="12" />
                </p>

                <form className="scope-goals-input" onSubmit={handleSubmit}>
                    <button type="submit" className="button-class" >Submit</button>
                </form>

                {showPopup && !isValid && verseSubmit && (<Popup open={showPopup} closeOnDocumentClick onClose={closePopup}>
                <div>
                    
                    <p className="validate-message" style={{ color: "red" }}>Incorrect. Please try again. {verseSubmit}</p>
                    <button onClick={closePopup}>Close</button>
                </div>
                </Popup> )}

                {showPopup && isValid && verseSubmit && (<Popup open={showPopup} closeOnDocumentClick onClose={closePopup}>
                <div>
                    
                    <p className="validate-message" style={{ color: "green" }}> Great Work! The correct answer is: {wordData.name}</p>
                    <button onClick={closePopup}>Close</button>
                </div>
                </Popup> )}
        
            </div>
            
            <div className="return-to-foths-from-study">
                    <a id="return-to-dashboard-hyperlink" href="./#/foths">Home</a>
            </div>


            <Footer/>


        </div>


    )
    }


    export default Recall;
