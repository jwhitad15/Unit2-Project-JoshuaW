// Component that receives user input

import React, { useState } from "react";


const AdminQuery = () => {
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

        <label className="scope-presetGoals-banner"><hr/>PARAMETERS<hr/> <br/> </label>

        <label for="goals">Command</label> <br/>
        <select id="goals"   className="goal-select"  >
          <option value="0"></option>
          <option value="1">View</option>
          <option value="2">Add</option>
          <option value="3">Update</option>
          <option value="3">Delete</option>
        </select> <br /> <br className="desktop-scope-breakpoint" />
        <label >Type</label> <br/>
        <select id="goals"  className="goal-select" >
          <option value="0"></option>
          <option value="1">User</option>
          <option value="2">Scripture</option>
          <option value="3">Question</option>
        </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
       

         <hr className="scope-line"/>

        <label> 
          <label className="scope-customGoals-banner">ID<br className="mobile-scope-breakpoint"/> <hr /> </label> <br />
          {/* Validation - makes sure user at least inputs 4 characters in textbox */}
        </label> 
        <input className="admin-textfield" placeholder="123"/> <br/> <br />
        <br />

        <button type="submit" className="account-button-class" >Submit</button>  <br/>  <br/>
      

        <div> {!isCustomValid && titleSubmit && (<p style={{color: 'red' }}> Must Add Description </p>)} </div>
        <div> {!isCustomValid && goalSubmit && (<p style={{color: 'red' }}> Must Add Title </p>)} </div> 


      </form> <br/>


      {/* <div> { ((isValid && !titleSubmit && !goalSubmit) || (isValid && isCustomValid)) && <UtilBibledDropdown goalData={selectedGoal} />} </div> */}
      {/* <div> { isCustomValid && <DisplayCustomGoal data={goalSubmit} customTitle={titleSubmit} />} </div> */}


    </div>
  );
}

export default AdminQuery;

