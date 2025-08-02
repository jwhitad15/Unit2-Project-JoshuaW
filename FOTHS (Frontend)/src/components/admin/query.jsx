// Component that receives user input

import React, { useState } from "react";


const AdminQuery = ({ setFetchedData }) => {
  // // Custom Description
  // const [goalInput, setGoalInput] = useState('');
  // const [goalSubmit, setGoalSubmit] = useState('');
  // // Dropdown
  // const [goal, setGoal] = useState('')
  // const [selectedGoal, setSelectedGoal] = useState('')
  // // Custom Title
  // const [title, setTitle] = useState('');
  // const [titleSubmit, setTitleSubmit] = useState('');

  // const [isValid, setIsValid] = useState(false);
  // const [isCustomValid, setIsCustomValid] = useState(false);

  // // functions that handle events and allow program to execute logic
  // const handleChange = e => {
  //   setGoalInput(e.target.value)
  // };

  // const handleDropdown = e => {
  //   setGoal(e.target.value);
  // }

  // const handleTitle = e => {
  //   setTitle(e.target.value);
  // }


  // const handleSubmit = e => {
  //   e.preventDefault(); 

  //   setIsValid(false)
  //   setIsCustomValid(false)

  //   if (goal !== 0 && goal != '') {
  //     setIsValid(true);
  //   } 
  //   if (title !== ('') && goalInput !== ('')) {
  //     setIsCustomValid(true)
  //   }

  //   setGoalSubmit(goalInput);
  //   setGoalInput('');

  //   setSelectedGoal(goal);
  //   setGoal('');

  //   setTitleSubmit(title);
  //   setTitle('');
    
  // };

  const [command, setCommand] = useState(""); // Tracks the Command dropdown selection
  const [type, setType] = useState(""); // Tracks the Type dropdown selection
  const [id, setId] = useState(""); // Tracks the ID input
  //const [fetchedData, setFetchedData] = useState([]); // Holds the fetched data
  const [errorMessage, setErrorMessage] = useState(""); // Tracks error messages

  const handleCommandChange = (e) => {
    setCommand(e.target.value);
  };

  const handleTypeChange = (e) => {
    setType(e.target.value);
  };

  const handleIdChange = (e) => {
    setId(e.target.value);
  };


  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!command || !type) {
      setErrorMessage("Please select both Command and Type.");
      return;
    }

    if (command === "view") {
      try {
        console.log("Fetching data with command:", command, "type:", type, "id:", id);
        // Construct the API URL based on whether an ID is provided
        const url = id.trim()
        ? `http://localhost:8080/${type}/${id}` // Fetch specific record by ID
        : `http://localhost:8080/${type}`; // Fetch all records of the selected type
        console.log("API URL:", url);
      // Make an API call to fetch data
      const response = await fetch(url, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (!response.ok) {
          throw new Error("Failed to fetch data.");
        }

        const data = await response.json();
        console.log("Fetched data:", data);

        setFetchedData(data); // Set the fetched data in state
        setErrorMessage(""); // Clear any previous error messages
      } catch (error) {
        console.error("Error fetching data:", error);
        setErrorMessage("Failed to fetch data. Please try again.");
      }
    } else if (command === "delete") {
      try {
        console.log("Fetching data with command:", command, "type:", type, "id:", id);
        let deleteID = id.trim()// Construct the API URL based on whether an ID is provided
        const url = `http://localhost:8080/${type}/${command}/${deleteID}` // Fetch specific record by ID
// Fetch all records of the selected type
        console.log("API URL:", url);
      // Make an API call to fetch data
      const response = await fetch(url, {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (response.status === 204) {
          console.log("Record deleted successfully. No content returned.");
          setFetchedData("Content Deleted"); // Set fetchedData to an empty array
          setErrorMessage(""); // Clear any previous error messages
          return;
        }
  
        if (!response.ok) {
          throw new Error("Failed to delete data.");
        }
      } catch (error) {
        console.error("Error executing command:", error);
        setErrorMessage("Failed to execute command. Please try again.");
      }
    } else {
      setErrorMessage("Invalid command selected.");
    }
  };


  return (

    <div style={{ textAlign: "center", marginTop: "20px" }}>

      <form className="scope-goals-input" onSubmit={handleSubmit}>

        <label className="scope-presetGoals-banner"><hr/>PARAMETERS<hr/> <br/> </label>

        <label htmlFor="goals">Command</label> <br/>
        <select id="goals"   className="goal-select"  value={command} onChange={handleCommandChange} >
          <option value=""></option>
          <option value="view">View</option>
          <option value="add">Add</option>
          <option value="update">Update</option>
          <option value="delete">Delete</option>
        </select> <br /> <br className="desktop-scope-breakpoint" />
        <label >Type</label> <br/>
        <select id="goals"  className="goal-select" value={type} onChange={handleTypeChange}>
          <option value=""></option>
          <option value="users">User</option>
          <option value="scriptures">Scripture</option>
          <option value="questions">Question</option>
        </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
       

         <hr className="scope-line"/>

        <label> 
          <label className="scope-customGoals-banner">ID<br className="mobile-scope-breakpoint"/> <hr /> </label> <br />
          {/* Validation - makes sure user at least inputs 4 characters in textbox */}
        </label> 
        <input className="admin-textfield" placeholder="123" value={id} onChange={handleIdChange}/> <br/> <br />
        <br />

        <button type="submit" className="account-button-class" >Submit</button>  <br/>  <br/>
      
        {errorMessage && <p style={{ color: "white" }}>{errorMessage}</p>}
      </form> <br/>

      {/* <div>
        <h2>Fetched Data:</h2>
        {Array.isArray(fetchedData) ? (
          fetchedData.length > 0 ? (
            <ul>
              {fetchedData.map((item, index) => (
                <li key={index}>{JSON.stringify(item)}</li>
              ))}
            </ul>
          ) : (
            <p>No data fetched yet.</p>
          )
        ) : fetchedData && typeof fetchedData === "object" ? (
          <div>
            <p>{JSON.stringify(fetchedData)}</p>
          </div>
        ) : (
          <p>No data fetched yet.</p>
        )}
      </div> */}
    </div>

  );
}

export default AdminQuery;

