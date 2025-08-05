// Component that receives user input

import React, { useState } from "react";
import DisplaySelectedDropdown from "./foths-display-user-selected-dropdown"
import DisplayCustomGoal from "./foths-display-user-custom-goal";


const UserInteraction = () => {
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

        <label className="scope-presetGoals-banner"><hr/>PRESET GOALS<hr/> <br/> </label>

        <label >Choose a Goal:</label> <br/>

        <select id="goals" value={goal}  className="goal-select" onChange={handleDropdown} >
          <option value="0"></option>
          <option value="1">Complete Faith Study Mode</option>
          <option value="2">Complete Faith Recall Mode</option>
          <option value="3">Complete Faith Multichoice Quiz</option>
        </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>

         <hr className="scope-line"/>

        <label> 
          <label className="scope-customGoals-banner">CUSTOM GOAL <br className="mobile-scope-breakpoint"/> <hr /> </label> <br />
          {/* Validation - makes sure user at least inputs 4 characters in textbox */}
          <input maxLength='15' minLength='4' className="custom-title-scope-textfield" type="text" placeholder="Goal Title" value={title} onChange={handleTitle} /> <br /> 
          <textarea maxLength='50' minLength='10' className="custom-description-scope-textfield" type="text" placeholder="Description" value={goalInput} onChange={handleChange} />
        </label> <br />

        <div> {!isCustomValid && titleSubmit && (<p style={{color: 'red' }}> Must Add Description </p>)} </div>
        <div> {!isCustomValid && goalSubmit && (<p style={{color: 'red' }}> Must Add Title </p>)} </div> 

        <button type="submit" className="scope-button-class" >Submit</button>

      </form> <br/>


      <div> { ((isValid && !titleSubmit && !goalSubmit) || (isValid && isCustomValid)) && <DisplaySelectedDropdown goalData={selectedGoal} />} </div>
      <div> { isCustomValid && <DisplayCustomGoal data={goalSubmit} customTitle={titleSubmit} />} </div>


    </div>
  );
}

export default UserInteraction;

