// Component that receives user input

import React, { useState } from "react";
import UtilBibledDropdown from "./util-bible-dropdown";


const UtilBible = () => {
  // Custom Description
  const [goalInput, setGoalInput] = useState('');
  const [goalSubmit, setGoalSubmit] = useState('');
  // Dropdown
  const [goal, setGoal] = useState('')
  const [selectedGoal, setSelectedGoal] = useState('')
  // Custom Title
  const [title, setTitle] = useState('');
  const [titleSubmit, setTitleSubmit] = useState('');

  const [isValid, setIsValid] = useState(false);
  const [isCustomValid, setIsCustomValid] = useState(false);

  // functions that handle events and allow program to execute logic
  const handleChange = e => {
    setGoalInput(e.target.value)
  };

  const handleDropdown = e => {
    setGoal(e.target.value);
  }

  const handleTitle = e => {
    setTitle(e.target.value);
  }


  const handleSubmit = e => {
    e.preventDefault(); 

    setIsValid(false)
    setIsCustomValid(false)

    if (goal !== 0 && goal != '') {
      setIsValid(true);
    } 
    if (title !== ('') && goalInput !== ('')) {
      setIsCustomValid(true)
    }

    setGoalSubmit(goalInput);
    setGoalInput('');

    setSelectedGoal(goal);
    setGoal('');

    setTitleSubmit(title);
    setTitle('');
    
  };


  return (

    <div style={{ textAlign: "center", marginTop: "20px" }}>

      <form className="scope-goals-input" onSubmit={handleSubmit}>

        <label className="scope-presetGoals-banner"><hr/>SELECTIONS<hr/> <br/> </label>

        <label for="goals">Select a Book</label> <br/>

        <select id="goals" value={goal}  className="goal-select" onChange={handleDropdown} >
          <option value="0"></option>
          <option value="1">Genesis</option>
          <option value="2">Exodus</option>
          <option value="3">Leviticus</option>
          <option value="3">Numbers</option>
          <option value="3">Deuteronomy</option>
          <option value="3">Joshua</option>
          <option value="3">Judges</option>
          <option value="3">Ruth</option>
          <option value="3">1 Samuel</option>
          <option value="3">2 Samuel</option>
          <option value="3">1 Kings</option>
          <option value="3">2 Kings</option>
          <option value="3">1 Chronicles</option>
          <option value="3">2 Chronicles</option>
          <option value="3">Ezra</option>
          <option value="3">Nehemiah</option>
          <option value="3">Esther</option>
          <option value="3">Job</option>
          <option value="3">Psalms</option>
          <option value="3">Proverbs</option>
          <option value="3">Ecclesiastes</option>
          <option value="3">Song of Solomon</option>
          <option value="3">Ezekiel</option>
          <option value="3">Daniel</option>
          <option value="3">Hosea</option>
          <option value="3">Joel</option>
          <option value="3">Amos</option>
          <option value="3">Obadiah</option>
          <option value="3">Jonah</option>
          <option value="3">Micah</option>
          <option value="3">Nahum</option>
          <option value="3">Habakkuk</option>
          <option value="3">Zephaniah</option>
          <option value="3">Haggai</option>
          <option value="3">Zechariah</option>
          <option value="3">Malachi</option>
          <option value="3">Matthew</option>
          <option value="3">Mark</option>
          <option value="3">Luke</option>
          <option value="3">John</option>
          <option value="3">Acts</option>
          <option value="3">Romans</option>
          <option value="3">1 Corinthians</option>
          <option value="3">2 Corinthians</option>
          <option value="3">Galatians</option>
          <option value="3">Ephesians</option>
          <option value="3">Philippians</option>
          <option value="3">Colossians</option>
          <option value="3">1 Thessalonians</option>
          <option value="3">2 Thessalonians</option>
          <option value="3">1 Timothy</option>
          <option value="3">2 Timothy</option>
          <option value="3">Titus</option>
          <option value="3">Philemon</option>
          <option value="3">Hebrews</option>
          <option value="3">James</option>
          <option value="3">1 Peter</option>
          <option value="3">2 Peter</option>
          <option value="3">1 John</option>
          <option value="3">2 John</option>
          <option value="3">3 John</option>
          <option value="3">Jude</option>
          <option value="3">Revelation</option>
        </select> <br /> <br className="desktop-scope-breakpoint" />
        
        <button type="submit" className="scope-button-class" >Submit</button>  <br/>  <br/>

         <hr className="scope-line"/>

        <label> 
          <label className="scope-customGoals-banner">VIEWPORT <br className="mobile-scope-breakpoint"/> <hr /> </label> <br />
          {/* Validation - makes sure user at least inputs 4 characters in textbox */}
          <div className="eBible-window">
            <p>FETCHED E-BIBLE</p>
            <p>AI E-BIBLE</p>
            <p>AI E-BIBLE</p>
          </div>
        </label> <br />
      

        <div> {!isCustomValid && titleSubmit && (<p style={{color: 'red' }}> Must Add Description </p>)} </div>
        <div> {!isCustomValid && goalSubmit && (<p style={{color: 'red' }}> Must Add Title </p>)} </div> 


      </form> <br/>


      <div> { ((isValid && !titleSubmit && !goalSubmit) || (isValid && isCustomValid)) && <UtilBibledDropdown goalData={selectedGoal} />} </div>
      <div> { isCustomValid && <DisplayCustomGoal data={goalSubmit} customTitle={titleSubmit} />} </div>


    </div>
  );
}

export default UtilBible;

